# シンプルなMakefile - lexコマンドとclangのみ使用

# 実行ファイル名
TARGET = lexer

# デフォルトターゲット - すべてのビルドを実行
all: $(TARGET)

# lexの呼び出し
lex.yy.c: lex.l
	lex lex.l

# clangでコンパイル
$(TARGET): lex.yy.c
	clang -o $(TARGET) lex.yy.c -ll

# クリーンアップ
clean:
	rm -f lex.yy.c $(TARGET)

.PHONY: all clean
