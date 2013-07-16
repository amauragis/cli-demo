%{
/* Global and header definitions required */

#include "functions.h"
#include "parser.h"
#include "lexer.h"
#ifndef YY_TYPEDEF_YY_SCANNER_T
#define YY_TYPEDEF_YY_SCANNER_T
typedef void* yyscan_t
#endif

%}


%output "parser.c"
%defines "parser.h"

%define api.pure
%lex-param  {yyscan_t scanner}
%parse-param {SExpression **expression}
%parse-param {yyscan_t scanner}

%union {
    int value;
    SExpression *expression;
}


/* Declarations (Optional token definitions) */

%left '+' TOKEN PLUS
%left '*' TOKEN_MULTIPLY

%token TOKEN_LPAREN
%token TOKEN_RPAREN
%token TOKEN_PLUS
%token TOKEN_MULTIPLY
%token <value> TOKEN_NUMBER

%type <expression> expr


%%
/* Parsing ruleset definitions */
input
    : expr { *expression = $1; }
    ;

expr
    : expr TOKEN_PLUS expr { $$ = createOperation(ePLUS, $1, $3); }
    | expr TOKEN_MULTIPLY expr { $$ = createOperation(eMULTIPLY, $1, $3); }
    | TOKEN_LPAREN expr TOKEN_RPAREN { $$ = $2; }
    | TOKEN_NUMBER { $$ = createNumber($1); }
    ;

%%
