%{
#include <stdio.h>
int nchar = 0;
int nword = 0;
int nline = 0;
%}

%%

\n         { nline++; nchar++; }
[^ \t\n]+  { nword++; nchar += yyleng; }
.          { nchar++; }

%%

int main(void) {
    printf("テキストを入力してください（終了は Ctrl+D）:\n");
    yylex();
    printf("\n統計情報:\n");
    printf("文字数: %d\t単語数: %d\t行数: %d\n", nchar, nword, nline);
    return 0;
}

int yywrap() {
    return 1;
}
