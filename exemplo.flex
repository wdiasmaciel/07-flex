/* Alguns métodos e variáveis disponíveis:
 * int yyline: armazena o número da linha atual.
 * int yycolumn: armazena o número da coluna atual na linha atual.
 * String yytext(): método que retorna a sequência de caracteres que foi casada com a regra.
 * int yylength(): método que retorna o comprimento da sequência de caracteres que foi casada com a regra.
 */

/* Definição: seção para código do usuário. */

%{
    import java.lang.*;
    public String getLexema() {
        return yytext(); // Apenas retorna o valor de yytext().
    }
%}

%%

/* Opções e Declarações: seção para diretivas e macros. */

// Diretivas:
%standalone    // Execução independente do analisador sintático.
%line          // Permite usar yyline.
%column        // Permite usar yycolumn.
%class Scanner // Troca o nome da classe Yylex para Scanner.

// Macros:
letra = [a-zA-Z]
numero = [0-9]
digito = {numero}+
identificador = {letra}({letra}|{numero})*

%%

/* Regras e Ações Associadas: seção de instruções para 
 * o analisador léxico. 
 */

{digito}        {System.out.println(" -> Encontrei um <Token: DIGITO, Lexema: "        + yytext() + ", Tamanho: " + yylength() + ", Linha: " + yyline + ", Coluna: " + yycolumn + ">");}
{identificador} {System.out.println(" -> Encontrei um <Token: IDENTIFICADOR, Lexema: " + yytext() + ", Tamanho: " + yylength() + ", Linha: " + yyline + ", Coluna: " + yycolumn + ">");}