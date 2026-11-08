
%{
#include <stdio.h>
%}

%%
[aeiouAEIOU] {
    printf("Vowel\n");
}

[a-zA-Z] {
    printf("Consonant\n");
}

. {
    printf("Not an alphabet\n");
}
%%

int main()
{
    printf("Enter a character: ");
    yylex();
    return 0;
}

int yywrap()
{
    return 1;
}
