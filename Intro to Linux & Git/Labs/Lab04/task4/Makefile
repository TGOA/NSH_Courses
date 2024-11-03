CC = gcc
CFLAGS = -g


ifdef ENWALL
CFLAGS += -Wall
endif


all: build/main.o build/string_utils.o build/math_utils.o
	$(CC) $(CFLAGS) -o build/app build/main.o build/string_utils.o build/math_utils.o

build/main.o: main.c | build
	$(CC) $(CFLAGS) -c main.c -o build/main.o

build/math_utils.o: inc1/math_utils.c inc1/math_utils.h | build
	$(CC) $(CFLAGS) -c inc1/math_utils.c -o build/math_utils.o

build/string_utils.o: inc2/string_utils.c inc2/string_utils.h | build
	$(CC) $(CFLAGS) -c inc2/string_utils.c -o build/string_utils.o

build:
	mkdir -p build

clean:
	rm -rf build

help:
	@echo "Makefile usage:"
	@echo "  make all    : Build the project"
	@echo "  make clean  : Remove the build directory and object files"
	@echo "  make help   : show help message"


