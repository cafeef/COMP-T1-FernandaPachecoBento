/*
    * Declarações para uma linguaguem de programação básica 
*/

/* interface com o lexer */
extern int yylineno;
void yyerror(char *s, ...);

/* tabela de símbolos */
struct symbol {
    char *name; // um nome da variável
    double value; 
    struct ast *func; //stmt para função
    struct symlist *syms; //lista de argumentos
};

/* lista de símbolos de tamanho fixo*/
#define NHASH 9997
struct symbol symtab[NHASH];

struct symbol *lookup(char*);

/* lista de símbolos, para uma lista de argumentos */
struct symlist {
    struct symbol *sym;
    struct symlist *next;
};

struct symlist *newsymlist(struct symbol *sym, struct symlist *next);
void symlistfree(struct symlist *sl);

/* tipos de nós
+ - * /
0-7 operações de comparação, 04 igual, 02 menor que, 01 maior que
L expressão ou lista de comandos
I comando IF 
W comando WHILE
FO comando FOR
A operação and
O operação or
N symbol de referencia
= atribuição
S lista de simbolos
F chamada de funcao pre-definida
C chamada de funcao df. p/ usuario
*/

enum bifs { 
    B_sqrt = 1, 
    B_exp, 
    B_log, 
    B_print
};

/* nós na AST */
// todos tem o "nodetype" inicial em comum

struct ast {
    int nodetype;
    struct ast *l;
    struct ast *r;
};

struct fncall { //funções pré-definidas
    int nodetype; // tipo F
    struct ast *l;
    enum bifs functype;
};

struct ufncall { // funções do usuário
    int nodetype; // tipo C
    struct ast *l; // lista de argumentos
    struct symbol *s;
};

struct flow {
    int nodetype; /* tipo I ou W */
    struct ast *cond; // condição
};