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

	case T_TYPE_SHORT: return "T_TYPE_SHORT";
	case T_TYPE_UNSIGNED: return "T_TYPE_UNSIGNED";

	case T_IF: return "T_IF";
	case T_ELSE: return "T_ELSE";
	case T_WHILE: return "T_WHILE";
	case T_FOR: return "T_FOR";
	case T_BREAK: return "T_BREAK";
	case T_CONTINUE: return "T_CONTINUE";
	case T_RETURN: return "T_RETURN";

	case T_LPAR: return "T_LPAR";
	case T_RPAR: return "T_RPAR";
	case T_LCUR: return "T_LCUR";
	case T_RCUR: return "T_RCUR";
	
	case T_NEG: return "T_NEG"; // !
	case T_MUL: return "T_MUL"; // *
	case T_DIV: return "T_DIV"; // /
	case T_MOD: return "T_MOD"; // %
	case T_PLUS: return "T_PLUS"; // +
	case T_MINUS: return "T_MINUS"; // -
	case T_LT: return "T_LT"; // <
	case T_GT: return "T_GT"; // >
	case T_LEQ: return "T_LEQ"; // <=
	case T_GEQ: return "T_GEQ"; // >=
	case T_EQ: return "T_EQ"; // ==
	case T_NEQ: return "T_NEQ"; // !=
	case T_AND: return "T_AND"; // &&
	case T_OR: return "T_OR"; // ||

	case T_SEMI: return "T_SEMI"; // ;
	case T_ASSI: return "T_ASSI"; // =
	case T_COMMA: return "T_COMMA"; //
	
	case T_ID: return "T_ID";
	case T_INT: return "T_INT";
	case T_CHAR: return "T_CHAR";
	case T_STRING: return "T_STRING";
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
