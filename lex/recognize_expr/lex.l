%{
#include <stdio.h>
%}

%%

[0-9]+     { printf("NUMBER(%s)\n", yytext); }
\+         { printf("PLUS\n"); }
-          { printf("MINUS\n"); }
\*         { printf("MULTIPLY\n"); }
\/         { printf("DIVIDE\n"); }
\(         { printf("LPAREN\n"); }
\)         { printf("RPAREN\n"); }
[ \t\n]+   { /* 空白や改行は無視 */ }
.          { printf("UNKNOWN(%s)\n", yytext); }

%%

int main(void) {
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}
