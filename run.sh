EXECUTABLE="vypa17"
RULES_FLEX="rules.l"
RULES_BISON="rules.y"
SRC_FLEX="rules.l.c"
SRC_BISON="rules.b.c"

function removeFileIfExists {
	if [ -f $1 ]; then
		rm -rf $1
	fi
}

removeFileIfExists $EXECUTABLE
removeFileIfExists $SRC_FLEX
rm -rf *.o
echo "##COMPILE######################################################"
flex -o $SRC_FLEX $RULES_FLEX
gcc -c $SRC_FLEX
g++ -c main.cpp
g++ main.o rules.l.o -o $EXECUTABLE
echo "###############################################################"

if [ -f $EXECUTABLE ]; then
	./$EXECUTABLE in/1.c
fi