EXECUTABLE="vypa17"

SCANNER_L="scanner.l"
SCANNER_C="scanner.c"
SCANNER_O="scanner.o"

PARSER_L="parser.y"
PARSER_C="parser.c"
PARSER_H="parser.h"


function removeFileIfExists {
	if [ -f $1 ]; then
		rm -rf $1
	fi
}

function clean {
	removeFileIfExists $EXECUTABLE
	removeFileIfExists $SCANNER_C
	rm -rf *.o
}

clean

echo "##COMPILE######################################################"
flex -o $SCANNER_C $SCANNER_L
gcc -c $SCANNER_C

g++ -c main.cpp
g++ main.o $SCANNER_O -o $EXECUTABLE
echo "###############################################################"

if [ -f $EXECUTABLE ]; then
	./$EXECUTABLE in/1.c
fi

clean