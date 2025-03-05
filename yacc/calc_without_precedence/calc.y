%{
#include <stdio.h>
#include <stdlib.h>

int yylex(void);
void yyerror(const char *s);

%}

%union {
        int ival;
}

%type <ival> expr
%type <ival> lines

%token <ival> NUMBER
%token EOL

%left '+' '-' '*' '/'

%%

lines   : lines expr EOL { printf("= %d\n", $2); }
        | ;

expr    : expr '+' expr  { $$ = $1 + $3; }
        | expr '-' expr  { $$ = $1 - $3; }
        | expr '*' expr  { $$ = $1 * $3; }
        | expr '/' expr  { $$ = $1 / $3; }
        | NUMBER         { $$ = $1; }
        ;
%%

void yyerror(const char *s) {
        fprintf(stderr, "error: %s\n", s);
}

int main(void) {
        return yyparse();
}
