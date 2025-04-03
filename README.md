# 07-jflex

## Instalação:
`sudo apt update`

`sudo apt install jflex`

# Alguns métodos e variáveis disponíveis:
 * **int yyline**: armazena o número da linha atual.
 * **int yycolumn**: armazena o número da coluna atual na linha atual.
 * **String yytext()**: método que retorna a sequência de caracteres que foi casada com a regra.
 * **int yylength()**: método que retorna o comprimento da sequência de caracteres que foi casada com a regra.

 Para se usar esses métodos e variáveis, é necessário incluir as diretivas abaixo na seção 2:
 * **%line**: permite usar yyline.
 * **%column**: permite usar yycolumn.

 **OBS**: a diretiva "%class" permite alterar o nome padrão da classe Yylex.java.
 
 Exemplo:
 
 * **%class AnalisadorLexico**
 
 ou
 
 * **%class Scanner**

# Exemplo: 

## Arquivo: exemplo.flex

<pre>
/* Alguns métodos e variáveis disponíveis:
 * int yyline: armazena o número da linha atual.
 * int yycolumn: armazena o número da coluna atual na linha atual.
 * String yytext(): método que retorna a sequência de caracteres que foi casada com a regra.
 * int yylength(): método que retorna o comprimento da sequência de caracteres que foi casada com a regra.
 */

/* Definição: seção para código do usuário. */
%standalone         // Execução independente do analisador sintático.
%line               // Permite usar yyline.
%column             // Permite usar yycolumn.
%class Scanner      // Troca o nome da classe Yylex para Scanner.

%{
    public String getLexema() {
        return yytext(); // Apenas retorna o valor de yytext().
    }
%}

%%

/* Declarações: seção para macros. */

// Macros:
letra = [a-zA-Z]
numero = [0-9]
digito = {numero}+
identificador = {letra}({letra}|{numero})*

%%

/* Regras e Ações Associadas: seção de instruções para 
 * o analisador léxico. 
 */

{digito}        {System.out.println(" -> Encontrei um <Token: DIGITO, Lexema: "        + getLexema() + ", Tamanho: " + yylength() + ", Linha: " + yyline + ", Coluna: " + yycolumn + ">");}
{identificador} {System.out.println(" -> Encontrei um <Token: IDENTIFICADOR, Lexema: " + getLexema() + ", Tamanho: " + yylength() + ", Linha: " + yyline + ", Coluna: " + yycolumn + ">");}
</pre>

## Arquivo: entrada01.txt:
<pre>
abcde
abc

abc123
123abcd
456abc
7890
</pre>

## Arquivo: entrada02.txt:

<pre>
1
a

2
b
1a
a2
b1
aba
121
</pre>

## Execução:
`jflex exemplo.flex`

`javac Scanner.java`

`java Scanner entrada01.txt`

`java Scanner entrada02.txt`

## Jogando a saída num arquivo:
`java Scanner entrada01.txt > saida01.txt`

`java Scanner entrada02.txt > saida02.txt`

# Git
`git add .`

`git commit -m "Exemplo"`

`git push`