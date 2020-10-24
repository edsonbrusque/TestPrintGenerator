all: TestPrint.exe

TestPrint.exe: main.o file.o
	 gcc -o TestPrint.exe main.o file.o

main.o: main.c
	 gcc -c main.c

file.o: file.c
	 gcc -c file.c
     
clean:
	 rm main.o file.o TestPrint.exe