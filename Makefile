UNAME := $(shell uname)
CC = gcc
CFLAGS = -Wall -std=c11 -g
LDFLAGS= -L.

SPL = SampleGPXfiles/
SRC = src/
BIN = bin/
PARSER_SRC_FILES = $(wildcard src/GPX*.c)
PARSER_OBJ_FILES = $(patsubst src/GPX%.c,bin/GPX%.o,$(PARSER_SRC_FILES))

ifeq ($(UNAME), Linux)
	XML_PATH = /usr/include/libxml2
endif
ifeq ($(UNAME), Darwin)
	XML_PATH = /System/Volumes/Data/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/libxml2
endif

clean:
	rm -rf $(BIN)xmlParser $(BIN)*.o $(BIN)*.so

#This is the target for the XML Parser
xmlParser: $(SRC)libXmlParser.c
	$(CC) $(CFLAGS) -I$(XML_PATH) $(SRC)libXmlParser.c -lxml2 -o $(BIN)xmlParser

#these are used to run my main file.
build: xmlParser

run:
	$(BIN)xmlParser $(SPL)sample.gpx

run2:
	$(BIN)xmlParser $(SPL)sample2.gpx
	
run3:
	$(BIN)xmlParser $(SPL)sample3.gpx
	
run4:
	$(BIN)xmlParser $(SPL)sample4.gpx

###################################################################################################
