#ifndef ETOKENTYPE
#define ETOKENTYPE
enum ETokenType{
	T_TYPE_INT=1,
	T_TYPE_CHAR,
	T_TYPE_STRING,
	T_TYPE_VOID,

	T_TYPE_SHORT,
	T_TYPE_UNSIGNED,

	T_IF,
	T_ELSE,
	T_WHILE,
	T_FOR,
	T_BREAK,
	T_CONTINUE,
	T_RETURN,

	T_LPAR,
	T_RPAR,
	T_LCUR,
	T_RCUR,
	
	T_NEG, // !
	T_MUL, // *
	T_DIV, // /
	T_MOD, // %
	T_PLUS, // +
	T_MINUS, // -
	T_LT, // <
	T_GT, // >
	T_LEQ, // <=
	T_GEQ, // >=
	T_EQ, // ==
	T_NEQ, // !=
	T_AND, // &&
	T_OR, // ||

	T_SEMI, // ;
	T_ASSI, // =
	T_COMMA, // ,
	
	T_ID,
	T_INT,
	T_CHAR,
	T_STRING,
	T_ERR
	
};
#endif