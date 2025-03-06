%{
#include <stdio.h>

/* トークンの種類を定義 */
#define NUMBER 1
#define PLUS   2
#define MINUS  3
#define MULT   4
#define DIV    5
%}

%%

[0-9]+(\.[0-9]+)?  { printf("NUMBER: %s\n", yytext); return NUMBER; }
"+"                { printf("PLUS\n"); return PLUS; }
"-"                { printf("MINUS\n"); return MINUS; }
"*"                { printf("MULTIPLY\n"); return MULT; }
"/"                { printf("DIVIDE\n"); return DIV; }
[ \t\n]+           { /* 空白と改行は無視 */ }
.                  { printf("UNKNOWN: %s\n", yytext); }

%%

int main(void) {
    int token;
    while ((token = yylex()) != 0) {
      // do something
    }

    return 0;
}

int yywrap(void) {
    return 1;
}
