#include<stdio.h>
#include "type.h"
#include "expr.h"
#include "stmt.h"


struct decl{

  char* name;
  struct type* type;
  struct expression* value;
  struct stmt* code;
  struct decl* next;
};

struct decl* create_decl(char* name, struct type* type, struct expression* value, struct stmt* code, struct decl* next);


