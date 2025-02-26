CC = clang
LEX = lex
YACC = yacc -d

TARGET = calc
SRCS = y.tab.c lex.yy.c ast.c
OBJS = y.tab.o lex.yy.o ast.o

all: $(TARGET)

$(TARGET): $(OBJS)
	$(CC) -o $(TARGET) $(OBJS)

y.tab.c: calc.y
	$(YACC) calc.y

lex.yy.c: calc.l
	$(LEX) calc.l

ast.o: ast.c ast.h
	$(CC) -c ast.c

clean:
	rm -f $(TARGET) $(OBJS) y.tab.c y.tab.h lex.yy.c
