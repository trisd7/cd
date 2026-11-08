
%{
#include <stdio.h>
int words = 0, lines = 0;
%}

%%
[a-zA-Z0-9]+  { words++; }
\n            { lines++; }
.             ;
%%

int main()
{
    printf("Enter text (Ctrl+D to stop):\n");
    yylex();

    printf("Number of words = %d\n", words);
    printf("Number of lines = %d\n", lines);

    return 0;
}

int yywrap()
{
    return 1;
}
