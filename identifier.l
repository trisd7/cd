
%{
#include <stdio.h>
%}

%%
[a-zA-Z_][a-zA-Z0-9_]*  { printf("Valid Identifier\n"); }
[0-9][a-zA-Z0-9_]*     { printf("Invalid Identifier\n"); }
.                       { printf("Invalid Identifier\n"); }
%%

int main()
{
    printf("Enter an identifier: ");
    yylex();
    return 0;
}

int yywrap()
{
    return 1;
}
