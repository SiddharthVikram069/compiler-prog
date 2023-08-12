%{

#include<stdio.h>
#include<stdlib.h>
#include"y.tab.h"  // bison generated header

%}

%%


"int" {return INTEGER;}
"string" {return STRING; }
"return" {return RETURN; }
"if" {return IF; }
"else" {return ELSE; }
"for" {return FOR; }
"while" {return WHILE; }
"&&" {return AND; }
"||" {return OR; }
"!" {return NOT; }
"!=" {return NOT_EQUAL; }
"==" {return EQUAL; }
"<" {return LT; }
"<=" {return LT_EQUAL; }
">" {return GT; }
">=" {return GT_EQUAL; }
"+" {return ADD; }
"-" {return SUB; }
"/" {return DIV; }
"*" {return MUL; }
"%" {return MOD; }
"{" {return LBRACE; }
"}" {return RBRACE; }
"(" {return LPAREN; }
")" {return RPAREN; }
"[" {return LBRACKET; }
"]" {return RBRACKET; }
";" {return SEMI_COL; }
"," {return COMMA; }
":" {return COLON; }
"=" {return ASSIGN; }
"print" {return PRINT; }
"function" {return FUNCTION; }
"array" {return ARRAY; }
[0-9]+ {yylval.int_value = atoi(yytext); return INTEGER_LITERAL; }
[A-Z][a-zA-Z0-9_]* {yylval.identifier = strdup(yytext); return IDENTIFIER; } 
\"(\\.|[^\"])*\" {yylval.string_value = strdup(yytext); return STRING_LITERAL; } 
[ \t\n]+ ; // skip whitespace, tabs and newlines 
. {printf("Unrecognised Token: %s\n", yytext); }


%%


int yywrap(void){

	return 1;
}




































