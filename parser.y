%{
#include<stdio.h>
#include "decl.h"
#include "stmt.h"
#include "expr.h"
int yylex();
decl* root; 
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

prog: decl_list {$$ = $1; root = $$; }
    ;

decl_list: decl2 {$$ = $1; }
	 | {$$ = NULL; } 
	 ;

decl2: decl2 decl {$1->next = $2; $$ = $1; }
     | decl {$$ = $1; }

decl: var_decl SEMI_COL {$$ = $1; }
    | func_decl {$$ = $1; }
    ;

var_decl: IDENTIFIER COLON type {$$ = create_decl($1, $3, NULL, NULL, NULL); }
	| IDENTIFIER COLON ARRAY type LBRACKET INTEGER_LITERAL RBRACKET
	| IDENTIFIER COLON type ASSIGN value {$$ = create_decl($1, $3, $5, NULL, NULL); }
	;

value: INTEGER_LITERAL {$$ = create_expr_integer_literal($1); }
     | STRING_LITERAL {$$ = create_expr_string_literal($1); }


type: INTEGER {$$ = create_type(TYPE_INT, NULL, NULL); }
    | STRING {$$ = create_type(TYPE_STR, NULL, NULL); }
    ;


func_decl: IDENTIFIER COLON FUNCTION type LPAREN params RPAREN compound_stmt
	 {$$ = create_decl($1, create_type(TYPE_FUNCTION, $4, $6), NULL, $8, NULL); }
	 ;

params: param_list {$$ = $1; }
      | {$$ = NULL; }
      ;

param_list: param_list COMMA param {$1->next = $3; $$ = $1; }
	  | param {$$ = $1; }
	  ;

param: IDENTIFIER COLON type {$$ = create_param($1, $3, NULL); }
     ;


compound_stmt: LBRACE stmt_list RBRACE {$$ = create_stmt(STMT_BLOCK, NULL, NULL, NULL, NULL, $2, NULL, NULL); }
	     ;

stmt_list: stmt_list stmt {$1->next = $2; }
	 | stmt {$$ = $1; }
	 ;

stmt: expr_stmt {$$ = $1; }
    | var_decl SEMI_COL {$$ = create_stmt(STMT_DECL, $1, NULL, NULL, NULL, NULL, NULL, NULL); }
    | FOR LPAREN expr SEMI_COL expr SEMI_COL for_step RPAREN stmt 
    {$$ = create_stmt(STMT_FOR, NULL, $3, $5, $7, $9, NULL, NULL); }

    | WHILE LPAREN expr RPAREN stmt {$$ = create_stmt(STMT_WHILE, NULL, NULL, $3, NULL, $5, NULL, NULL); }
    | RETURN expr SEMI_COL {$$ = create_stmt(STMT_RETURN, NULL, NULL, $2, NULL, NULL, NULL, NULL); }
    | PRINT LPAREN expr RPAREN SEMI_COL {$$ = create_stmt(STMT_PRINT, NULL, NULL, $3, NULL, NULL, NULL, NULL); }
    | if_stmt {$$ = $1; }
    | compound_stmt {$$ = $1; }
    ;

expr_stmt: expr SEMI_COL {$$ = create_stmt(STMT_EXPR, NULL, NULL, $1, NULL, NULL, NULL, NULL); }
	 | SEMI_COL {$$ = NULL; }
	 ;

if_stmt: IF LPAREN expr RPAREN stmt {$$ = create_stmt(STMT_CONDITIONAL, NULL, NULL, $3, NULL, $5, NULL, NULL); } 
       | IF LPAREN expr RPAREN stmt ELSE stmt {$$ = create_stmt(STMT_CONDITIONAL, NULL, NULL, $3, NULL, $5, $7, NULL); }
       ;

for_step: expr_stmt SEMI_COL {$$ = create_stmt(STMT_EXPR, NULL, NULL, $1, NULL, NULL, NULL, NULL); }
	| SEMI_COL {$$ = NULL; }
	;

expr: INTEGER_LITERAL   { $$ = create_expr_integer_literal($1);}
    | STRING_LITERAL    { $$ = create_expr_string_literal($1); }
    | IDENTIFIER        { $$ = create_expr_name($1); }
    | LPAREN expr RPAREN  {$$ = $2; }
    | IDENTIFIER LBRACKET expr RBRACKET {$$ = create_expr(EXPR_ARRAY, create_expr_name($1), $3); }
    | IDENTIFIER LPAREN arg_list RPAREN {$$ = create_expr(EXPR_FUNC, create_expr_name($1), $3); } 
    | SUB expr    %prec NOT {$$ = create_expr(EXPR_UN_MIN, $2); }
    | expr ADD expr {$$ = create_expr(EXPR_ADD, $1, $3); }
    | expr SUB expr {$$ = create_expr(EXPR_SUB, $1, $3); }
    | expr MUL expr {$$ = create_expr(EXPR_MUL, $1, $3); }
    | expr DIV expr {$$ = create_expr(EXPR_DIV, $1, $3); } 
    | expr MOD expr {$$ = create_expr(EXPR_MOD, $1, $3); }
    | expr EQUAL expr {$$ = create_expr(EXPR_EQ, $1, $3); }
    | expr NOT_EQUAL expr {$$ = create_expr(EXPR_NE, $1, $3); }
    | expr GT expr {$$ = create_expr(EXPR_GT, $1, $3); }
    | expr GT_EQUAL expr {$$ = create_expr(EXPR_GE, $1, $3); }
    | expr LT expr {$$ = create_expr(EXPR_LT, $1, $3); }
    | expr LT_EQUAL expr {$$ = create_expr(EXPR_LE, $1, $3); }
    | expr AND expr {$$ = create_expr(EXPR_AND, $1, $3); } 
    | expr OR expr {$$ = create_expr(EXPR_OR, $1, $3); }
    | expr ASSIGN expr {$$ = create_expr(EXPR_ASSIGN, $1, $3); } 
    ; 

arg_list: arg_list COMMA expr {$$ = create_expr(EXPR_ARG, $1, $3); }
	| expr {$$ = create_expr(EXPR_ARG, $1, NULL); }
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





























