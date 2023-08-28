#include<stdio.h>

typedef enum{
	
  TYPE_VOID,
  TYPE_BOOL,
  TYPE_INT,
  TYPE_STR,
  TYPE_ARRAY,
  TYPE_FUNCTION,
  
} type_t;

struct type{
  type_t kind;
  struct type* subtype;
  struct param_list* params;
};

struct param_list{
  const char* name;
  struct type* type;
  struct param_list* next;
};

struct type* create_type(type_t kind, struct type* subtype, struct param_list* params);
struct param_list* create_param(char* name, struct type* type, struct param_list* next);
