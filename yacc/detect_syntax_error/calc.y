%{
#include <stdio.h>
int yylex(void);
void yyerror(char *s);
%}

%token NUMBER PLUS MINUS MULT DIV

%%
expr:
    NUMBER
    | expr PLUS expr
    | expr MINUS expr
    | expr MULT expr
    | expr DIV expr
    /* ()に対応するにはどうしたらいいでしょう？ */
    ;
%%

int main(void) {
    return yyparse();
}

void yyerror(char *s) {
    fprintf(stderr, "error: %s\n", s);
}
