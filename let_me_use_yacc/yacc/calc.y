%{
#include <stdio.h>
#include <stdlib.h>
#include "ast.h"

void yyerror(const char *s);
int yylex(void);
int yyparse(void);

ASTNode *root; // ASTのルートノード
%}

/* 演算子の優先順位と結合規則 */
%left '+' '-'
%left '*' '/'
%right UMINUS

/* 非終端記号の型を定義 */
%union {
    int num;
    ASTNode *node;
}

/* 各ルールの返り値の型を指定 */
%type <node> expr
%token <num> NUMBER

%%
/* 文法ルール */
input:
    | input line
    ;

line:
    '\n'
    | expr '\n' {
        root = $1;
        printf("Abstract Syntax Tree:\n");
        print_ast(root, 0);
        free_ast(root);
    }
    ;

/* AST を構築するためのルール */
expr:
    NUMBER {
        $$ = new_number_node($1);
    }
    | expr '+' expr {
        $$ = new_operator_node(NODE_ADD, $1, $3);
    }
    | expr '-' expr {
        $$ = new_operator_node(NODE_SUB, $1, $3);
    }
    | expr '*' expr {
        $$ = new_operator_node(NODE_MUL, $1, $3);
    }
    | expr '/' expr {
        $$ = new_operator_node(NODE_DIV, $1, $3);
    }
    | '-' expr %prec UMINUS {
        $$ = new_operator_node(NODE_NEG, $2, NULL);
    }
    | '(' expr ')' {
        $$ = $2;
    }
    ;

%%

/* エラー処理 */
void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}

/* 構文解析のエントリーポイント */
int main(void) {
    printf("Enter expressions:\n");
    return yyparse();
}
