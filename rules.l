%option noyywrap
%option yylineno

%{
#include "tokenTypes.h"
%}

commentoneline "//"[^\r\n]*
whitespace [ \t\n]
integer [0-9]+
id [a-zA-Z_][0-9a-zA-Z_]*
charescape (\\t|\\n|\\\|\\')

%%

\n                   { /*neccessary for yylineno working*/ }

"int"	{return T_TYPE_INT;}
"char"	{return T_TYPE_CHAR;}
"void"	{return T_TYPE_VOID;}

"("				{ return T_LPAR; }
")"             { return T_RPAR; }
"{"             { return T_LCUR; }
"}"             { return T_RCUR; }
";"             { return T_SEMI; }
"="				{ return T_ASSI; }
","				{ return T_COMMA; }

'(.|{charescape})'	{
	return T_CHAR;
}

{integer}	{
	return T_INT;
}

{id}   {
    return T_ID;
}

{whitespace}*	{}

.	{
	return T_ERR;
}
