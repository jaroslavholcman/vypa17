
%{
#include <stdio.h>

extern void yyerror(const char* s);
extern int yylex();
%}


%union {
	char chvalue;
	int ivalue;
	char* svalue;
}


%token T_TYPE_INT
%token T_TYPE_CHAR
%token T_TYPE_STRING
%token T_TYPE_VOID

%token T_TYPE_SHORT
%token T_TYPE_UNSIGNED

%token T_IF
%token T_ELSE
%token T_WHILE
%token T_FOR
%token T_BREAK
%token T_CONTINUE
%token T_RETURN

%token T_LPAR
%token T_RPAR
%token T_LCUR
%token T_RCUR

%token T_NEG
%token T_MUL
%token T_DIV
%token T_MOD
%token T_PLUS
%token T_MINUS
%token T_LT
%token T_GT
%token T_LEQ
%token T_GEQ
%token T_EQ
%token T_NEQ
%token T_AND
%token T_OR

%token T_SEMI
%token T_ASSI
%token T_COMMA

%token <svalue> T_ID
%token <ivalue> T_INT
%token <chvalue> T_CHAR
%token <svalue> T_STRING
%token T_ERR


%start start

%%

start: T_IF {
	printf("if found");
}

%%
void yyerror (char const *s) {
   fprintf (stderr, "%s\n", s);
 }

int pars(){
	return yyparse();
}