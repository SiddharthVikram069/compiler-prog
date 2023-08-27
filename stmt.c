#include<stdio.h>
#include "stmt.h"

struct stmt* create_stmt(stmt_t kind, struct decl* decl, struct expression* init_expr, struct expression* expr, struct expression* next_expr,
			struct stmt* body, struct body* else_body, struct stmt* next){

  struct stmt* stmt = malloc(sizeof(*stmt));
  stmt->kind = kind;
  stmt->decl = decl;
  stmt->init_expr = init_expr;
  stmt->expr = expr;
  stmt->next_expr = next_expr;
  stmt->body = body;
  stmt->else_body = else_body;
  stmt->next = next;
}
