
%{
#include <stdio.h>
%}

%%
"//".*                  { printf("Comment\n"); }
[0-9]+                  { printf("Constant\n"); }
[a-zA-Z_][a-zA-Z0-9_]*\( { printf("User Defined Function\n"); }
[a-zA-Z_][a-zA-Z0-9_]*  { printf("Identifier\n"); }
[ \t\n]+                ;
.                       ;
%%

int main()
{
    printf("Enter input:\n");
    yylex();
    return 0;
}

int yywrap()
{
    return 1;
}
