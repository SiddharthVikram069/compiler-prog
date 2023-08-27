#include<stdio.h>
#include "decl.h"
#include "expr.h"
#include "type.h"


typedef enum{

  STMT_EXPR,
  STMT_DECL,

  STMT_CONDITIONAL,
  STMT_FOR,
  STMT_WHILE,
  STMT_RETURN,
  STMT_PRINT,

  STMT_BLOCK
} stmt_t;


struct stmt{

  stmt_t kind;
  struct decl* decl;
  
  // can be used for "for" loop arguments 
  struct expression* init_expr;
  struct expression* expr;
  struct expression* next_expr;

  struct stmt* body;
  struct stmt* else_body; // in case of an if-else statment
  struct stmt* next

};


struct stmt* create_stmt(stmt_t kind, struct decl* decl, struct expression* init_expr, struct expression* expr, struct expression* next_expr,
			struct stmt* body, struct body* else_body, struct stmt* next);


