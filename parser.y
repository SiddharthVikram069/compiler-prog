%{
#include<stdio.h>
#include "decl.h"
#include "stmt.h"
#include "expr.h"
int yylex();
%}

%union{

	int int_value;
	char* string_value;
	char* identifier;
}

%token <int_value> INTEGER_LITERAL
%token <string_value> STRING_LITERAL 
%token <identifier> IDENTIFIER
%token LPAREN RPAREN LBRACE RBRACE LBRACKET RBRACKET WHILE FOR IF ELSE PRINT ADD SUB MUL DIV MOD LT GT LT_EQUAL GT_EQUAL NOT_EQUAL EQUAL 
%token SEMI_COL COLON COMMA AND OR NOT RETURN FUNCTION ARRAY INTEGER STRING 

%start prog

%left COMMA
%right ASSIGN 
%left OR 
%left AND
%left EQUAL NOT_EQUAL
%left LT LT_EQUAL GT GT_EQUAL
%left ADD SUB
%left MUL DIV MOD
%right NOT
%left LPAREN LBRACKET 
%nonassoc RPAREN
%nonassoc ELSE

%%

prog: decl_list
    ;

decl_list: decl2
	 |  
	 ;

decl2: decl2 decl
     | decl

decl: var_decl SEMI_COL
    | func_decl
    ;

var_decl: IDENTIFIER COLON type 
	| IDENTIFIER COLON ARRAY type LBRACKET INTEGER_LITERAL RBRACKET
	| IDENTIFIER COLON type ASSIGN value
	;

value: INTEGER_LITERAL
     | STRING_LITERAL


type: INTEGER
    | STRING
    ;


func_decl: IDENTIFIER COLON FUNCTION type LPAREN params RPAREN compound_stmt
	 ;

params: param_list
      | 
      ;

param_list: param_list COMMA param
	  | param
	  ;

param: IDENTIFIER COLON type
     ;


compound_stmt: LBRACE stmt_list RBRACE
	     ;

stmt_list: stmt_list stmt
	 | stmt
	 ;

stmt: expr_stmt 
    | var_decl SEMI_COL
    | FOR LPAREN INTEGER_LITERAL SEMI_COL INTEGER_LITERAL SEMI_COL for_step RPAREN stmt
    | WHILE LPAREN expr RPAREN stmt 
    | RETURN expr SEMI_COL
    | PRINT LPAREN expr RPAREN SEMI_COL
    | if_stmt
    | compound_stmt
    ;

expr_stmt: expr SEMI_COL
	 | SEMI_COL
	 ;

if_stmt: IF LPAREN expr RPAREN stmt 
       | IF LPAREN expr RPAREN stmt ELSE stmt
       ;

for_step: expr_stmt SEMI_COL
	| SEMI_COL
	;

expr: INTEGER_LITERAL
    | STRING_LITERAL 
    | IDENTIFIER 
    | LPAREN expr RPAREN
    | IDENTIFIER LBRACKET expr RBRACKET 
    | IDENTIFIER LPAREN arg_list RPAREN 
    | SUB expr    %prec NOT
    | expr ADD expr
    | expr SUB expr 
    | expr MUL expr 
    | expr DIV expr
    | expr MOD expr
    | expr EQUAL expr
    | expr NOT_EQUAL expr
    | expr GT expr 
    | expr GT_EQUAL expr
    | expr LT expr
    | expr LT_EQUAL expr
    | expr AND expr
    | expr OR expr
    | expr ASSIGN expr 
    ; 

arg_list: arg_list COMMA expr
	| expr
	;




%%

// extern FILE* yyin; //flex input file stream

void yyerror(char* s){

	fprintf(stderr, "%s \n", s);
}

int main(int argc, char* argv){
	
/*
	if(argc != 2}	
		fprintf(stderr, "usage: %s <input_file>\n", argv[0]);
		return 1;
	}

	FILE* input_file = fopen(argv[1], "r");
	if(!input_file){
		printf("could not open file \n");
		return 1;
	}
*/
//	yyin = input_file;
	int result = yyparse();
//	fclose(input_file);

	if(result == 0){
		printf("Parsing successful\n");

	}
	else{
		fprintf(stderr, "Parsing failed\n");
	}

	return result;

}





























