#include<stdio.h>
#include "decl.h"

struct decl* create_decl(char* name, struct type* type, struct expression* value, struct stmt* code, struct decl* next){

  struct decl* decl = malloc(sizeof(*decl));
  decl->name = name;
  decl->type = type;
  decl->value = value;
  decl->code = code;
  decl->next = next;
}

