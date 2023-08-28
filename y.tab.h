/* A Bison parser, made by GNU Bison 3.5.1.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2020 Free Software Foundation,
   Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* Undocumented macros, especially those whose name start with YY_,
   are private implementation details.  Do not rely on them.  */

#ifndef YY_YY_Y_TAB_H_INCLUDED
# define YY_YY_Y_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    INTEGER_LITERAL = 258,
    STRING_LITERAL = 259,
    IDENTIFIER = 260,
    LPAREN = 261,
    RPAREN = 262,
    LBRACE = 263,
    RBRACE = 264,
    LBRACKET = 265,
    RBRACKET = 266,
    WHILE = 267,
    FOR = 268,
    IF = 269,
    ELSE = 270,
    PRINT = 271,
    ADD = 272,
    SUB = 273,
    MUL = 274,
    DIV = 275,
    MOD = 276,
    LT = 277,
    GT = 278,
    LT_EQUAL = 279,
    GT_EQUAL = 280,
    NOT_EQUAL = 281,
    EQUAL = 282,
    SEMI_COL = 283,
    COLON = 284,
    COMMA = 285,
    AND = 286,
    OR = 287,
    NOT = 288,
    RETURN = 289,
    FUNCTION = 290,
    ARRAY = 291,
    INTEGER = 292,
    STRING = 293,
    ASSIGN = 294
  };
#endif
/* Tokens.  */
#define INTEGER_LITERAL 258
#define STRING_LITERAL 259
#define IDENTIFIER 260
#define LPAREN 261
#define RPAREN 262
#define LBRACE 263
#define RBRACE 264
#define LBRACKET 265
#define RBRACKET 266
#define WHILE 267
#define FOR 268
#define IF 269
#define ELSE 270
#define PRINT 271
#define ADD 272
#define SUB 273
#define MUL 274
#define DIV 275
#define MOD 276
#define LT 277
#define GT 278
#define LT_EQUAL 279
#define GT_EQUAL 280
#define NOT_EQUAL 281
#define EQUAL 282
#define SEMI_COL 283
#define COLON 284
#define COMMA 285
#define AND 286
#define OR 287
#define NOT 288
#define RETURN 289
#define FUNCTION 290
#define ARRAY 291
#define INTEGER 292
#define STRING 293
#define ASSIGN 294

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
union YYSTYPE
{
#line 6 "parser.y"


	int int_value;
	char* string_value;
	char* identifier;

#line 142 "y.tab.h"

};
typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
