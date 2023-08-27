#include<stdio.h>
#include "expr.h"

struct expression* create_expr(expr_t kind, struct expression *left, struct expression *right){

  struct expression *expr = malloc(sizeof(*expr));
  expr->kind = kind;
  expr->integer_value = NULL;
  expr->string_literal = NULL;
  expr->name = NULL;
  expr->left = left;
  expr->right = right;
  return expr;
}

struct expression* create_expr_name(const char* name){
  struct expression* expr = create_expr(EXPR_NAME, NULL, NULL);
  expr->name = name;
  return expr;
}

struct expression* create_expr_integer_literal(int i){
  
  struct expression* expr = create_expr(EXPR_INT, NULL, NULL);
  expr->integer_literal = i;
  return expr;
}

struct expression* create_expr_string_literal(const char* str){

  struct expression* expr = create_expr(EXPR_STR, NULL, NULL);
  expr->string_literal = str;
  return expr;
}

struct expression* create_expr_boolean_literal(int b){

  struct expression* expr = create_expr(EXPR_BOOL, NULL, NULL);
  expr->integer_literal = b;
  return expr;
}
