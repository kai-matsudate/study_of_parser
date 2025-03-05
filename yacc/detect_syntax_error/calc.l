%{
#include "y.tab.h"
%}

%%
[0-9]+   { return NUMBER; }
"+"      { return PLUS; }
"-"      { return MINUS; }
"*"      { return MULT; }
"/"      { return DIV; }
[ \t\n]  ; /* whitespace */
%%

int yywrap(void) {
    return 1;
}
