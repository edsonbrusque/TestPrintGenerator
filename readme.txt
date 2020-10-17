TEST PRINT GENERATOR
Edson Brusque - September 2020


WHAT IS THIS?

This is a command line piece of software written in plain old C that generates GCODE files for testing various features of 3D printers.

GCODE is commands (like move, extrude, change temperature, etc) that 3D printers executes in sequential order.

This software generates a file, based on user parameters, that can be run on a machine for making "temperature towers" (for finding optimal extruding temperature), "stringing tests" (for finding best retraction settings) and other nerdy stuffs.


HOW CAN I USE IT?

First you set the general shape of the object you want to print in the "pattern.txt" file.

Then you set the parameters of your printer and your object in the "config.txt" file.

Finally, you just run the executable file "TestPrint.exe".

A "TestPrint.gcode" file will be created. You can put this file on an SD card or use any other method to send it to your 3D printer and generate the test object.


THERE'S SOME SAMPLE FILES?

Sure. You can find pattern.txt and config.txt example files on the child folders. There's temperature towers, retraction tests, speed test...


HOW DO I MODIFY THE CONFIG.TXT FILE TO SUIT MY NEEDS?

Just open it and change it according to your need or taste. Most of the parameters are pretty self explanatory.

Some parameters, like filamentDiameter and bedTemperature are static. This means that their values will be the same during the printing of the object.

Other parameters are variable during the printing time and here is where the fun happens. You can set for example:

	layerHeight 0.20
	layerHeightStart 0.10
	layerHeightFinish 0.40

This means that when just starting the printing, the layerHeight (0.20 mm) value will be used for generating the first layer. Then, the printer will make the print varying linearly the height of the layers from 0.10 mm for the second layer to 0.40 mm to the last layer. This way, you can analyze the difference in quality that different layer heigh can generate.

You can do this for other parameters like hotend temperature, print speed, retracttion length etc.


WHAT DOES THE NUMBERS IN THE PATTERN.TXT FILE MEAN?

They are just the points that define the pattern (the shape or profile) of the generated object.

For example, if you want to generate a square tube, you can use something like:

 90.0  90.0 1
 90.0 110.0 1
110.0 110.0 1
110.0  90.0 1

Each line defines a point. Well, sort off. Just bear with me.

The first column is the X coordinate. The second column is the Y coordinate.

The third column tells the generator if a move to this point is an "extrude" (a print) or a "travel" (a movement without any extrusion).

So, each line of the file define a point. But also, in a sense, defines a line. Yeah, I know it sound a little confuse but let's use another example:

 90.0  90.0 1
 90.0 110.0 1
110.0 110.0 1
110.0  90.0 0

In this case, we're still defining four points. But we're defining only three lines. So our object will have three sides. This kind of object is useful to test retractions or travel speeds, for example.


THAT SOUND NICE, BUT CAN I CHANGE THE SOURCE CODE?

You're invited to!!! This is free code. Use and abuse it.


HOW CAN I COMPILE IT IN WINDOWS?

In Windows probably the most easier way is using DEV-C++ (https://sourceforge.net/projects/orwelldevcpp/).

Open "main.c".
Go to Tools -> Compiler Options.
Click "Add the following commands when calling the compiler:".
Add "std=c99" do the corresponding text box and click OK.
Click [F11] and the program should compile and run.

We avoided using advanced resources so it should compile without any problems on most compilers and environments.


HOW CAN I COMPILE IT IN LINUX?

Just run "gcc main.c -lm -o TestPrint.exe" on the terminal on the same folder as "main.c"

If you have problems compiling, probably you don't gave the gcc compiler installed. Usually just running "sudo apt install gcc" on your terminal solves it.


THIS CODE IS STUPID. WHY?

Laziness, ignorance and lack of time. Not necessarily in this order.

But hey! You're invite to contribute. Let's make it better!

Just one point in my defense though: as I expect this code to be seen (and hopefully contributed) by people who are not day job C programmers, I preferred to sacrifice compactness and elegance for just plain simple and easy to understand code wherever I could.


WHY YOU WRITE YOUR COMMENTS IN ENGLISH? YOU'RE NOT EVEN GOOD AT IT?

Again, because I think this is useful code and I want people from all over the World to use, understand and contribute.

But I plan to maintain a Portuguese version of this readme.txt file. just look for the "leiame.txt".


THE BRIM SUCKS. CAN YOU MAKE IT BETTER?

Yeah, I know. :(

This is where the ignorance and lack of time comes into play. The way brims are generated only works well for very simple parts. But in general it performs the functions of keeping the object in place.

If you have an idea of how to make a better brim generator. Let me know.


ANY TO DO's?

Besides a better brim generator, a 'bottom' generator would be a good option for more complex parts. That's probably the next thing I'll implement.

Again, if you have any idea, let me know.


THANKS!

You're welcome. :)

