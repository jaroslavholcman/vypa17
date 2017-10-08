EXECUTABLE="vypa17"

SCANNER_L="scanner.l"
SCANNER_C="scanner.c"
SCANNER_O="scanner.o"

PARSER_Y="parser.y"
PARSER_C="parser.c"
PARSER_H="parser.h"
PARSER_O="parser.o"


function removeFileIfExists {
	if [ -f $1 ]; then
		rm -rf $1
	fi
}

function clean {
	
	removeFileIfExists $EXECUTABLE

	removeFileIfExists $SCANNER_C
	removeFileIfExists $SCANNER_O

	removeFileIfExists $PARSER_C
	removeFileIfExists $PARSER_H
	removeFileIfExists $PARSER_O

	rm -rf *.o
}

clean

echo "##COMPILE######################################################"
bison -o $PARSER_C --defines=$PARSER_H $PARSER_Y
g++ -c $PARSER_C

flex -o $SCANNER_C $SCANNER_L
g++ -c $SCANNER_C

g++ -c main.cpp
g++ main.o $PARSER_O $SCANNER_O -o $EXECUTABLE
echo "###############################################################"

if [ -f $EXECUTABLE ]; then
	./$EXECUTABLE in/1.c
fi

clean