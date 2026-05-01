<<<<<<< Updated upstream
Esse trabalho foi desenvolvido por **Fernanda Pacheco Bento** com o RA **2664429** para a disciplina de Compiladores.
Nesse conjunto de arquivos, estão presentes o código-fonte do projeto, um arquivo de teste para entrada no programa e o relatório.

Para testar a linguagem de programação básica, basta rodar no terminal dentro do projeto:
make 
./comp-t1 

Caso queira utilizar outro arquivo como entrada para o programa, crie um arquivo .txt e ao executá-lo, especifique o caminho do arquivo de entrada que deseja utilizar. 
./comp-t1 caminho/do/programa.txt
=======
# Trabalho de Compiladores

Este trabalho foi desenvolvido por **Fernanda Pacheco Bento**, RA **2664429**, para a disciplina de **Compiladores**.

## Sobre o Projeto

O projeto implementa uma linguagem de programação básica utilizando **Flex**, **Bison** e código auxiliar em **C**.

Neste repositório estão presentes:

- Código-fonte do projeto;
- Arquivo de teste para entrada no programa;
- Relatório do trabalho.

## Arquivos Principais

- `comp-t1.l`: especificação léxica da linguagem;
- `comp-t1.y`: especificação sintática da linguagem;
- `comp-t1.h`: declarações das estruturas e funções utilizadas;
- `comp-t1.c`: implementação auxiliar em C;
- `programa.txt`: arquivo de entrada usado como teste;
- `makefile`: arquivo para compilação do projeto.

## Como Compilar

Para compilar o projeto, execute no terminal dentro da pasta do projeto:

```bash
make
```

## Como Executar

Após a compilação, execute:

```bash
./comp-t1
```

Por padrão, o programa procura e executa o arquivo `programa.txt`.

## Usando Outro Arquivo de Entrada

Caso queira utilizar outro arquivo como entrada, crie um arquivo `.txt` e informe o caminho ao executar o programa:

```bash
./comp-t1 caminho/do/programa.txt
```

## Exemplo de Uso

```bash
make
./comp-t1
```

Ou, utilizando um arquivo específico:

```bash
./comp-t1 programa.txt
```

## Limpeza dos Arquivos Gerados

Para remover os arquivos gerados pela compilação, execute:

```bash
make clean
```
>>>>>>> Stashed changes
