#include <stdio.h>
#include <iostream>

#include "tokenTypes.h"

using namespace std;

extern "C" int yylex();
extern FILE* yyin;
extern int yylineno;
extern char *yytext;

//vraci nazev enumu (kvuli prehlednejsimu vypisu)
const char* ename(enum ETokenType e) {
	switch (e) {
		case T_TYPE_INT: return "T_TYPE_INT";
		case T_TYPE_CHAR: return "T_TYPE_CHAR";
		case T_TYPE_STRING: return "T_TYPE_STRING";
		case T_TYPE_VOID: return "T_TYPE_VOID";
		case T_LPAR: return "T_LPAR";
		case T_RPAR: return "T_RPAR";
		case T_LCUR: return "T_LCUR";
		case T_RCUR: return "T_RCUR";
		case T_SEMI: return "T_SEMI";
		case T_ASSI: return "T_ASSI";
		case T_COMMA: return "T_COMMA";
		case T_ID: return "T_ID";
		case T_INT: return "T_INT";
		case T_CHAR: return "T_CHAR";
		case T_ERR: return "T_ERR";   
	}
}

void run(){	
	ETokenType token=T_ERR;
	while (token=(ETokenType)yylex()){
        std::cout << yylineno << ": " << yytext << " [" << ename(token) << "]" << std::endl;
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
