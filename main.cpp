#include <stdio.h>
#include <iostream>

using namespace std;

extern "C" int yylex();
extern FILE* yyin;
extern int yylineno;
extern char *yytext;


void run(){
	int token=-1;
	while (token=yylex()){
        std::cout << yylineno << ": " << yytext << "[" << token << "]" << std::endl;
    }
}

void setup(char* filename){
	yyin = fopen(filename, "r");
}

int main(int argc, char* argv[]){


	setup(argv[1]);
	run();
	return 0;
}
