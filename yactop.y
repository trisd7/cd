%{
#include<stdio.h>
int yylex();
int yyerror(char *s);
%}
%expect 1
%%
S : 'i' E 't' S S1
  | 'a'
  ;

S1: 'c' S
  |
  ;

E : 'b'
  ;
%%

int yylex()
{
    int c;
    c=getchar();

    if(c>='a' && c<='z')
        return c;
    if(c=='\n')
        return 0;
   return c;
}
int yyerror(char *s)
{
    printf("Invalid String\n");
    return 0;
}

int main()
{
    printf("Enter string:\n");
    if(yyparse()==0)
      printf("valid");
    return 0;
}
