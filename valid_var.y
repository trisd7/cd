
%{
#include<stdio.h>
%}

%token LETTER DIGIT

%%
S : LETTER A;
A : LETTER A
  | DIGIT A
  | ;
%%

int main()
{
    printf("Enter a variable:\n");
    if(yyparse()==0)
        printf("Valid Variable");
    return 0;
}

int yyerror()
{
    printf("Invalid Variable");
    return 0;
}

int yylex()
{
    char c=getchar();
    
    if(c>='a' && c<='z' || c>='A' && c<='Z')
        return LETTER;

    if(c>='0' && c<='9')
        return DIGIT;

    if(c=='\n')
        return 0;

    return c;
}


    if(c>='a' && c<='z' || c>='A' && c<='Z')
