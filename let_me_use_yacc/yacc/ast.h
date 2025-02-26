#ifndef AST_H
#define AST_H

#include <stdio.h>
#include <stdlib.h>

// ASTノードの型定義
typedef enum {
    NODE_NUMBER,   // 数値
    NODE_ADD,      // 加算 (+)
    NODE_SUB,      // 減算 (-)
    NODE_MUL,      // 乗算 (*)
    NODE_DIV,      // 除算 (/)
    NODE_NEG,      // 単項マイナス (-X)
} NodeType;

// ASTノード構造体
typedef struct ASTNode {
    NodeType type;
    struct ASTNode *left;
    struct ASTNode *right;
    int value; // 数値用
} ASTNode;

// ノード作成関数
ASTNode *new_number_node(int value);
ASTNode *new_operator_node(NodeType type, ASTNode *left, ASTNode *right);
void free_ast(ASTNode *node);
void print_ast(ASTNode *node, int depth);

#endif
