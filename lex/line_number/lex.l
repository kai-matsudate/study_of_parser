%{
#include <stdio.h>
%}

%%

^(.*)\n    { printf("%4d\t%s", ++yylineno, yytext); }
^(.*)$     { printf("%4d\t%s\n", ++yylineno, yytext); }

%%

int main(int argc, char *argv[]) {
    if (argc < 2) {
        fprintf(stderr, "使用方法: %s ファイル名\n", argv[0]);
        return 1;
    }
    
    yyin = fopen(argv[1], "r");
    if (!yyin) {
        fprintf(stderr, "ファイルを開けませんでした: %s\n", argv[1]);
        return 1;
    }
    
    yylex();
    
    fclose(yyin);
    return 0;
}

int yywrap() {
    return 1;
}
