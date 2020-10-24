#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define M_PI 3.14159265358979323846  // pi

// *****************************************************************************
// This is just a structure to a point

struct point_st {
  float x;
  float y;
  float e;
};
typedef struct point_st point_t;

// *****************************************************************************
// Print variables and default values are defined here

float totalHeight = 50.0;
float filamentDiameter = 1.75;
float firstLayerHeight = 0.20;
float zSpeed = 20;
float bedTemperature = 60;
int brimCount = 5;

float layerHeight = 0.20;
float layerHeightStart = 0.20;
float layerHeightFinish = 0.20;

float layerWidth = 0.40;
float layerWidthStart = 0.40;
float layerWidthFinish = 0.40;

float printSpeed = 20;
float printSpeedStart = 20;
float printSpeedFinish = 20;

float travelSpeed = 120;
float travelSpeedStart = 120;
float travelSpeedFinish = 120;

float retractLength = 1.0;
float retractLengthStart = 1.0;
float retractLengthFinish = 1.0;

float minRetractDistance = 1.0;

float retractSpeed = 50;
float retractSpeedStart = 50;
float retractSpeedFinish = 50;

float temperature = 230;
float temperatureStart = 230;
float temperatureFinish = 230;

float fanSpeed = 0;
float fanSpeedStart = 128;
float fanSpeedFinish = 128;
float fanStartHeight = 0.6;

// *****************************************************************************
// These are counters for final statistics
float totalTime = 0;
float totalTravel = 0;
float totalExtrudeLength = 0;

// *****************************************************************************
// These variables hold the previous position so the extrude() function
// can calculate how much material it needs to extrude among other things
float previousX, previousY, previousZ;

// *****************************************************************************
// This will hold a pointer to our output file
FILE *fp;

// *****************************************************************************
// This function takes a float and returns millis in int format
// This is useful for some float comparisons
int m(float f) {
  return (int)(f * 1000);
}

// *****************************************************************************
// Function for changing the hotend temperature
void changeHotendTemperature(float temperature) {
  static float previousTemperature = -1;

  if (m(temperature) == m(previousTemperature)) return;

  fprintf(fp, "M104 S%.2f\n", temperature);

  previousTemperature = temperature;
}

// *****************************************************************************
// Functions for changing the speed of the hotend fan.
void changeFanSpeed(float fanSpeed) {
  static float previousFanSpeed = -1;

  if (m(fanSpeed) == m(previousFanSpeed)) return;

  fprintf(fp, "M106 S%.2f\n", fanSpeed);

  previousFanSpeed = fanSpeed;
}

// *****************************************************************************
// Functions for retracting and returning the filament.

float lengthRetracted = 0;

void retract() {
  fprintf(fp, "G1 F%.2f E-%.2f\n", retractSpeed * 60, retractLength);  // Retract filament
  lengthRetracted += retractLength;
}

void comeback() {
  fprintf(fp, "G1 F%.2f E%.2f\n", retractSpeed * 60, lengthRetracted);  // Return filament
  lengthRetracted = 0;
}

// *****************************************************************************
// This function moves the carriage in the z axis
void height(float z) {
  if (m(z) == m(previousZ)) return;

  fprintf(fp, "G0 F%.2f Z%.2f\n", zSpeed * 60, z);

  previousZ = z;
}

// *****************************************************************************
// This function creates a move to point  (x,y)
void move(float x, float y) {
  if (m(x) == m(previousX) && m(y) == m(previousY)) return;

  float distance = sqrt(pow(x - previousX, 2) + pow(y - previousY, 2));

  if (distance > minRetractDistance &&
      m(lengthRetracted) < m(retractLength)) retract();

  fprintf(fp, "G0 F%.2f X%.2f Y%.2f\n", travelSpeed * 60, x, y);

  previousX = x;
  previousY = y;
  totalTime += distance / printSpeed;
  totalTravel += distance;
}

// *****************************************************************************
// This function creates an extrude to point (x,y)
// The filament length is calculated to distance etc
void extrude(float x, float y) {
  float distance = sqrt(pow(x - previousX, 2) + pow(y - previousY, 2));
  float multiplier = (layerHeight * layerWidth) / (M_PI * filamentDiameter * filamentDiameter / 4);
  float extrude = distance * multiplier;

  if (m(x) == m(previousX) && m(y) == m(previousY)) return;

  if (m(lengthRetracted) > 0) comeback();

  fprintf(fp, "G1 F%.2f X%.2f Y%.2f E%.2f\n", printSpeed * 60, x, y, extrude);

  previousX = x;
  previousY = y;
  totalTime += distance / printSpeed;
  totalTravel += distance;
  totalExtrudeLength += extrude;
}

// *****************************************************************************
// We'll read the points that forms the shape of the object from file
// so we need some variables, functions, etc for that

#define MAX_POINTS 1000
point_t points[MAX_POINTS];

int numPoints = 0;

void addPoint(float x, float y, float e) {
  points[numPoints].x = x;
  points[numPoints].y = y;
  points[numPoints].e = e;
  numPoints++;
}

void readPatternFile() {
  FILE *fptr;

  if ((fptr = fopen("pattern.txt", "r")) == NULL) {
    printf("Error opening pattern.txt file.");
    exit(1);
  }

  float x, y, e;

  while (1) {
    int valuesRead = fscanf(fptr, "%f %f %f", &x, &y, &e);

    if (valuesRead < 3) break;

    fprintf(fp, "; %.2f %.2f %.2f\n", x, y, e);

    addPoint(x, y, e);
  }

  fclose(fptr);
}

// *****************************************************************************
// These functions read the settings from the config.txt file.

#define BUFFER_SIZE 65536
char *buffer;
int bufferCounter;
int bytesRead;

void readConfigIntoBuffer() {
  buffer = (char *)malloc(BUFFER_SIZE);
  if (buffer == NULL) {
    printf("ERROR: It was not possible to allocate memory buffer.");
    exit(1);
  }

  FILE *fptr;
  if ((fptr = fopen("config.txt", "r")) == NULL) {
    printf("Error opening config.txt file.");
    exit(1);
  }

  bytesRead = fread(buffer, 1, BUFFER_SIZE, fptr);

  printf("Config file read: %d bytes\n", bytesRead);

  fclose(fptr);
}

void bufferCounterReset() {
  bufferCounter = 0;
}

int readLineFromBuffer(char *str, int num) {
  int i = 0;

  while (i < num - 1) {
    char c = *(buffer + bufferCounter);
    bufferCounter++;

    if (c == 0) {
      break;
    } else if (bufferCounter >= bytesRead) {
      break;
    } else if (c == '\n') {
      break;
    }

    *(str + i) = c;
    i++;
  }

  *(str + i) = 0;

  if (bufferCounter >= bytesRead) {
    return EOF;
  }
  return i;
}

float readConfigFloat(char *parameter, float def) {
  int bytesRead;
  char line[256];
  char str[20];
  float f;

  bufferCounterReset();
  while (readLineFromBuffer(line, sizeof(line)) >= 0) {
    sscanf(line, "%s %f", str, &f);
    if (strcmp(str, parameter) == 0) {
      // Just some very primitive sanity check
      if (m(f) >= 0 && f < 1000) {
        def = f;
        fprintf(fp, "; %s = %.2f\n", str, f);
      }

      break;
    }
  }
  return def;
}

void readConfigFile() {
  totalHeight = readConfigFloat("totalHeight", 50.0);
  filamentDiameter = readConfigFloat("filamentDiameter", 1.75);
  firstLayerHeight = readConfigFloat("firstLayerHeight", 0.2);
  bedTemperature = readConfigFloat("bedTemperature", 60);
  brimCount = readConfigFloat("brimCount", 5);
  zSpeed = readConfigFloat("zSpeed", 10);
  minRetractDistance = readConfigFloat("minRetractDistance", 1.0);
  fanStartHeight = readConfigFloat("fanStartHeight", 0.6);

  layerHeight = readConfigFloat("layerHeight", 0.20);
  layerHeightStart = readConfigFloat("layerHeightStart", 0.20);
  layerHeightFinish = readConfigFloat("layerHeightFinish", 0.20);

  layerWidth = readConfigFloat("layerWidth", 0.40);
  layerWidthStart = readConfigFloat("layerWidthStart", 0.40);
  layerWidthFinish = readConfigFloat("layerWidthFinish", 0.40);

  printSpeed = readConfigFloat("printSpeed", 20);
  printSpeedStart = readConfigFloat("printSpeedStart", 20);
  printSpeedFinish = readConfigFloat("printSpeedFinish", 20);

  travelSpeed = readConfigFloat("travelSpeed", 120);
  travelSpeedStart = readConfigFloat("travelSpeedStart", 120);
  travelSpeedFinish = readConfigFloat("travelSpeedFinish", 120);

  retractLength = readConfigFloat("retractLength", 1.0);
  retractLengthStart = readConfigFloat("retractLengthStart", 1.0);
  retractLengthFinish = readConfigFloat("retractLengthFinish", 1.0);

  retractSpeed = readConfigFloat("retractSpeed", 25);
  retractSpeedStart = readConfigFloat("retractSpeedStart", 25);
  retractSpeedFinish = readConfigFloat("retractSpeedFinish", 25);

  temperature = readConfigFloat("temperature", 230);
  temperatureStart = readConfigFloat("temperatureStart", 230);
  temperatureFinish = readConfigFloat("temperatureFinish", 230);

  fanSpeed = readConfigFloat("fanSpeed", 0);
  fanSpeedStart = readConfigFloat("fanSpeedStart", 0);
  fanSpeedFinish = readConfigFloat("fanSpeedFinish", 0);
}

// *****************************************************************************
// And this is our main program entry point!
void main() {
  readConfigIntoBuffer();

  printf("Starting... ");

  fp = fopen("TestPrint.gcode", "w");  //opening file.

  fprintf(fp, "; Brusque's 3D Printer Test GCODE Generator\n");
  fprintf(fp, "\n");

  fprintf(fp, "; Reading parameters from config.txt\n");
  readConfigFile();
  fprintf(fp, "\n");

  fprintf(fp, "; Reading figure from pattern.txt\n");
  readPatternFile();
  fprintf(fp, "\n");

  fprintf(fp, "M220 S100 ; Reset Feedrate\n");
  fprintf(fp, "M221 S100 ; Reset Flowrate\n");
  fprintf(fp, "\n");
  fprintf(fp, "M140 S%.2f  ; Start preheating the bed\n", bedTemperature);
  fprintf(fp, "M190 S%.2f  ; WAIT\n", bedTemperature);
  fprintf(fp, "M104 S%.2f ; start preheating the hotend\n", temperature);
  fprintf(fp, "M109 S%.2f ; WAIT\n", temperature);
  fprintf(fp, "\n");

  fprintf(fp, "G28 ; Homing\n");
  //  fprintf(fp, "G29 ; Bed level\n");
  //  fprintf(fp, "M420 S1 ; Turn bed leveling on\n");
  fprintf(fp, "M420 S0 ; Turn bed leveling off\n");
  fprintf(fp, "\n");

  fprintf(fp, "G90 ; Absolute positioning\n");
  fprintf(fp, "M83 ; Relative extrusion\n");
  fprintf(fp, "\n");

  fprintf(fp, "M117 Priming\n");
  fprintf(fp, "G1 X0.0 Y0.0 F5000.0 ; Move to start position\n");
  fprintf(fp, "G1 X0.0 Y0.0 Z0.2 F5000.0 ; Lower Head\n");
  fprintf(fp, "G1 X200 Y0.0 Z0.2 F1500.0 E15 ; Draw the first line\n");
  fprintf(fp, "G1 X200 Y0.4 Z0.2 F5000.0 ; Move back a little\n");
  fprintf(fp, "G1 X0.0 Y0.4 Z0.2 F1500.0 E30 ; Draw the second line\n");
  fprintf(fp, "\n");

  fprintf(fp, "M117 Moving to start position\n");
  retract();
  height(10);
  move(points[0].x, points[0].y);
  fprintf(fp, "\n");

  // This is a not so sofisticated brim
  fprintf(fp, "M117 Brim\n");

  // Now is a good time to start the fan (or stop it) according to the settings
  changeFanSpeed(fanSpeed);

  float centerX = 0;
  float centerY = 0;
  for (int i = 0; i < numPoints; i++) {
    centerX += points[i].x;
    centerY += points[i].y;
  }
  centerX /= numPoints;
  centerY /= numPoints;

  for (int i = brimCount; i > 0; i--) {
    float x, y, d;

    height(firstLayerHeight);
    d = layerWidth * i;

    for (int j = 0; j < numPoints; j++) {
      if (points[j].x > centerX)
        x = points[j].x + d;
      else
        x = points[j].x - d;

      if (points[j].y > centerY)
        y = points[j].y + d;
      else
        y = points[j].y - d;

      if (points[j].e == 0) {
        move(x, y);
      } else {
        extrude(x, y);
      }
    }

    fprintf(fp, "\n");
  }

  // Make the actual build
  for (float z = firstLayerHeight; m(z) <= m(totalHeight); z += layerHeight) {
    float multiplier = (z - firstLayerHeight) / (totalHeight - firstLayerHeight);

    temperature = temperatureStart + (temperatureFinish - temperatureStart) * multiplier;

    printSpeed = printSpeedStart + (printSpeedFinish - printSpeedStart) * multiplier;

    travelSpeed = travelSpeedStart + (travelSpeedFinish - travelSpeedStart) * multiplier;

    retractSpeed = retractSpeedStart + (retractSpeedFinish - retractSpeedStart) * multiplier;

    retractLength = retractLengthStart + (retractLengthFinish - retractLengthStart) * multiplier;

    layerWidth = layerWidthStart + (layerWidthFinish - layerWidthStart) * multiplier;

    fanSpeed = fanSpeedStart + (fanSpeedFinish - fanSpeedStart) * (z - fanStartHeight) / (totalHeight - fanStartHeight);
    if (fanSpeed < 0) fanSpeed = 0;

    // Shows information on display about changing parameters
    fprintf(fp, "M117");
    if (m(temperatureStart) != m(temperatureFinish)) fprintf(fp, " t=%.2f�C", temperature);
    if (m(printSpeedStart) != m(printSpeedFinish)) fprintf(fp, " S=%.2fmm/s", printSpeed);
    if (m(travelSpeedStart) != m(travelSpeedFinish)) fprintf(fp, " T=%.2fmm/s", travelSpeed);
    if (m(retractSpeedStart) != m(retractSpeedFinish)) fprintf(fp, " R=%.2fmm/s", retractSpeed);
    if (m(retractLengthStart) != m(retractLengthFinish)) fprintf(fp, " L=%.2fmm", retractLength);
    if (m(layerWidthStart) != m(layerWidthFinish)) fprintf(fp, " W=%.2fmm", layerWidth);
    if (m(layerHeightStart) != m(layerHeightFinish)) fprintf(fp, " H=%.2fmm", layerHeight);
    if (m(fanSpeedStart) != m(fanSpeedFinish)) fprintf(fp, " F=%.2fmm", fanSpeed);
    fprintf(fp, "\n");

    if (m(z) >= m(fanStartHeight)) {
      changeFanSpeed(fanSpeed);
    }

    changeHotendTemperature(temperature);

    height(z);

    for (int j = 0; j < numPoints; j++) {
      if (points[j].e == 0) {
        move(points[j].x, points[j].y);
      } else {
        extrude(points[j].x, points[j].y);
      }
    }
    fprintf(fp, "\n");

    layerHeight = layerHeightStart + (layerHeightFinish - layerHeightStart) * multiplier;
  }

  retract();
  fprintf(fp, "G91 ; Relative positioning\n");
  height(10);  // Raise Z 10 mm
  fprintf(fp, "G90 ; Absolute positioning\n");
  move(0, 200);
  fprintf(fp, "\n");

  fprintf(fp, "M84 ; Disable all steppers\n");
  fprintf(fp, "M106 S0 ; Turn-off fan\n");
  fprintf(fp, "M104 S0 ; Turn-off hotend\n");
  fprintf(fp, "M140 S0 ; Turn-off bed\n");

  fprintf(fp, "\n");
  fprintf(fp, "; Total time = %.2f s = %.2f min\n", totalTime, totalTime / 60);
  fprintf(fp, "; Total travel = %.2f mm = %.2f m\n", totalTravel, totalTravel / 1000);
  fprintf(fp, "; Total extruded length = %.2f mm = %.2f m\n", totalExtrudeLength, totalExtrudeLength / 1000);

  fclose(fp);  //closing file.

  printf("Finished!\n");
}

// This is the end... my friend.
