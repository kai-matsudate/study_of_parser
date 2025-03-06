%{
#include "y.tab.h"
#include <stdlib.h>
%}

%%
[0-9]+ { yylval.ival = atoi(yytext); return NUMBER; }
[ \t]   ; /* 空白とタブは無視 */
\n      return EOL;
"+"     return '+';
"-"     return '-';
"*"     return '*';
"/"     return '/';
.      return yytext[0];

%%
int yywrap(void) {
        return 1;
}
