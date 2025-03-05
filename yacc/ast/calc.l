%{
#include "ast.h"
#include "y.tab.h"
%}

/* 字句解析ルール */
%%
[0-9]+  { yylval.num = atoi(yytext); return NUMBER; }
[ \t]   { /* 空白やタブは無視 */ }
\n      { return '\n'; }
.       { return yytext[0]; }

%%

/* 入力終了時 */
int yywrap(void) {
    return 1;
}
