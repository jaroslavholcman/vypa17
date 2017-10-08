#include <stdio.h>
#include <iostream>

#include "parser.h"

using namespace std;

extern FILE* yyin;
extern int yylineno;
extern char *yytext;


int main(int argc, char* argv[]){


	yyin = fopen(argv[1], "r");
	int retval = yyparse();
	printf("retval: %d\n", retval );
	return 0;
}
