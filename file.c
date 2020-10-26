// *****************************************************************************
// These functions read the settings from the config.txt file.
#include <stdio.h> 
#include <stdlib.h>
#include <string.h>

#include "global.h"

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
      if (((int)(f*1000)) >= 0 && f < 1000) {
        def = f;
        fprintf(fp, "; %s = %.2f\n", str, f);
      }

      break;
    }
  }
  return def;
}
