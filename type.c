#include<stdio.h>
#include "type.h"
#include "decl.h"
#include "stmt.h"
#include "expr.h"

struct type* create_type(type_t kind, struct type* subtype, struct param_list* params){
  struct type* type = malloc(sizeof(*type));
  type->kind = kind;
  type->subtype = subtype;
  type->params = params;
  return type;
}


struct param_list* create_param(char* name, struct type* type, struct param_list* next){
  struct param_list* params = malloc(sizeof(*params));
  params->name = name;
  params->type = type;
  params->next = next;
  return params;
}
