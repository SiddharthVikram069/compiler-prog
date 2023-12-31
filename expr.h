#include<stdio.h>

typedef enum{

  EXPR_INT,
  EXPR_STR,
  EXPR_BOOL

  EXPR_ADD,
  EXPR_SUB,
  EXPR_MUL,
  EXPR_DIV,
  EXPR_MOD,
  EXPR_AND,
  EXPR_ASSIGN,

  EXPR_ARRAY, // array subscrpting 
  EXPR_FUNC, // for function calls
  EXPR_ARG, // for function arguments

  EXPR_NAME,

  EXPR LT, 
  EXPR LE,
  EXPR GT,
  EXPR GE,
  EXPR EQ,
  EXPR NE


} expr_t;


struct expression{

  expr_t kind;
  struct expression *left;
  struct expression *right;
  const char *name;
  int integer_value;
  const char *string_literal;
};

struct expression* create_expr(expr_t kind, struct expression *left, struct expression *right);
struct expression* create_expr_name(const char* name);
struct expression* create_expr_integer_literal(int i);
struct expression* create_expr_string_literal(const char* str);
struct expression* create_expr_boolean_literal(int b);

































