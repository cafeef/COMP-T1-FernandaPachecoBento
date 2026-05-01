/* 
* Lexer para a linguagem de programação básica
*/

/* reconhecimento de tokens */
%option noyywrap nodefault yylineno
%{
#include <stdlib.h>
#include <string.h>
#include "comp-t1.h"
#include "comp-t1.tab.h"

static int eof_sent = 0;
%}

/* expoente float */
EXP ([Ee][-+]?[0-9]+)

%%

    /* caracteres únicos */
"+" {return yytext[0];}
"-" {return yytext[0];}
"*" {return yytext[0];}
"/" {return yytext[0];}
"=" {return yytext[0];}
"," {return yytext[0];}
";" {return yytext[0];}
"(" {return yytext[0];}
")" {return yytext[0];}

">" {yylval.fn = 1; return CMP;}
"<" {yylval.fn = 2; return CMP;}
"<>" {yylval.fn = 3; return CMP;}
"==" {yylval.fn = 4; return CMP;}
">=" {yylval.fn = 5; return CMP;}
"<=" {yylval.fn = 6; return CMP;}

    /* palavras chaves */
"if" {return IF;}
"then" {return THEN;}
"else" {return ELSE;}
"while" {return WHILE;}
"do" {return DO;}
"let" {return LET;}
"for" {return FOR;} //Adição do for
"and" {return AND;} /* Adição das operações AND e OR */
"or" {return OR;}

    /* funções pré-definidas */
"sqrt" {yylval.fn = B_sqrt; return FUNC;}
"exp" {yylval.fn = B_exp; return FUNC;}
"log" {yylval.fn = B_log; return FUNC;}
"print" {yylval.fn = B_print; return FUNC;}

    /* declaração de name e number */
[a-zA-Z][a-zA-Z0-9]* {yylval.s = lookup(yytext); return NAME;}
[0-9]+"."[0-9]*{EXP}? {yylval.d = atof(yytext); return NUMBER;}
[0-9]+{EXP}? {yylval.d = atof(yytext); return NUMBER;}
\"[^"\n]*\" {
    yylval.str = strdup(yytext + 1);
    yylval.str[yyleng - 2] = '\0';
    return STRING;
}
\'[^'\n]*\' {
    yylval.str = strdup(yytext + 1);
    yylval.str[yyleng - 2] = '\0';
    return STRING;
}

    /* lexemas ignorados */
"//".*
[ \t]
\\\n {if(interactive) printf("c> ");}
\n {return EOL;}
<<EOF>> {
    if(!eof_sent) {
        eof_sent = 1;
        return EOL;
    }
    yyterminate();
}

. {yyerror("Caracter desconhecido %c\n", *yytext);}
%%
