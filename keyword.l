
%{
#include <stdio.h>
%}

%%
"int"|"float"|"char"|"double"|"if"|"else"|"while"|"for"|"do"|"return"|"void"|"break"|"continue"|"switch"|"case"|"default"|"long"|"short"|"struct"|"typedef"|"const"|"static"|"sizeof"|"unsigned"|"signed"|"enum"|"union"|"goto"|"auto"|"extern"|"register" {
    printf("C Keyword\n");
}

[a-zA-Z_][a-zA-Z0-9_]* {
    printf("Not a Keyword\n");
}

[ \t\n]+ ;
. ;
%%

int main()
{
    printf("Enter a word: ");
    yylex();
    return 0;
}

int yywrap()
{
    return 1;
}
