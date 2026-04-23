# Makefile Genérico
NOME = comp-t1

all: $(NOME)

$(NOME): $(NOME).l $(NOME).y
	bison -d $(NOME).y
	flex $(NOME).l
	gcc -o $@ $(NOME).tab.c lex.yy.c -lfl

clean:
	rm -f $(NOME) $(NOME).tab.c $(NOME).tab.h lex.yy.c