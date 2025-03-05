#include "ast.h"

// 数値ノードの作成
ASTNode *new_number_node(int value) {
    ASTNode *node = (ASTNode *)malloc(sizeof(ASTNode));
    node->type = NODE_NUMBER;
    node->value = value;
    node->left = node->right = NULL;
    return node;
}

// 演算子ノードの作成
ASTNode *new_operator_node(NodeType type, ASTNode *left, ASTNode *right) {
    ASTNode *node = (ASTNode *)malloc(sizeof(ASTNode));
    node->type = type;
    node->left = left;
    node->right = right;
    return node;
}

// ASTノードの解放
void free_ast(ASTNode *node) {
    if (!node) return;
    free_ast(node->left);
    free_ast(node->right);
    free(node);
}

// AST の表示 (括弧付きで明示)
void print_ast(ASTNode *node, int depth) {
    if (!node) return;

    switch (node->type) {
        case NODE_NUMBER:
            printf("%d", node->value);
            break;
        case NODE_ADD:
            printf("(+ ");
            break;
        case NODE_SUB:
            printf("(- ");
            break;
        case NODE_MUL:
            printf("(* ");
            break;
        case NODE_DIV:
            printf("(/ ");
            break;
        case NODE_NEG:
            printf("(- ");
            break;
    }

    if (node->type != NODE_NUMBER) {
        print_ast(node->left, depth + 1);
        if (node->right) {
            printf(" ");
            print_ast(node->right, depth + 1);
        }
        printf(")");
    }
}
