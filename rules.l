%option noyywrap
%option yylineno

%{
#include "tokenTypes.h"
%}

commentoneline "//"[^\r\n]*
whitespace [ \t\v\n\f]
integer [0-9]+
id [a-zA-Z_][0-9a-zA-Z_]*
charescape (\\t|\\n|\\\|\\')

%%

\n                   { /*neccessary for yylineno working*/ }
{commentoneline} {}

"int"		{return T_TYPE_INT;}
"char"		{return T_TYPE_CHAR;}
"string"	{return T_TYPE_STRING;}
"void"		{return T_TYPE_VOID;}

"short"		{return T_TYPE_SHORT;}
"unsigned"	{return T_TYPE_UNSIGNED;}

"if" 		{return T_IF;}
"else" 		{return T_ELSE;}
"while" 	{return T_WHILE;}
"for" 		{return T_FOR;}
"break" 	{return T_BREAK;}
"continue" 	{return T_CONTINUE;}
"return" 	{return T_RETURN;}

"("				{ return T_LPAR; }
")"             { return T_RPAR; }
"{"             { return T_LCUR; }
"}"             { return T_RCUR; }

"!"				{ return T_NEG; }
"*"				{ return T_MUL; }
"/"				{ return T_DIV; }
"%"				{ return T_MOD; }
"+"				{ return T_PLUS; }
"-"				{ return T_MINUS; }
"<"				{ return T_LT; }
">"				{ return T_GT; }
"<="			{ return T_LEQ; }
">="			{ return T_GEQ; }
"=="			{ return T_EQ; }
"!="			{ return T_NEQ; }
"&&"			{ return T_AND; }
"||"			{ return T_OR; }

";"             { return T_SEMI; }
"="				{ return T_ASSI; }
","				{ return T_COMMA; }

\"(\\.|[^\\"])*\" 	{ 
	//http://www.lysator.liu.se/c/ANSI-C-grammar-l.html
	return T_STRING;
}

{integer}	{
	return T_INT; 
}

'(.|{charescape})'	{
	return T_CHAR;
}

{id}   {
    return T_ID;
}

{whitespace}*	{}

.	{
	printf("[ERR_LEX] error parsing token: \"%s\"\n",yytext);
	yyterminate();
}
