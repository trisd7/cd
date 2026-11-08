%{
#include<stdio.h>
%}
%token NUM LETTER
%left '+' '-'
%left '*' '/'
%%
E:E '+' E
 |E'-'E
 |E '*'E
 |E '/' E
 |NUM
 |LETTER
 ;
%%
int main()
{
printf("enter expr:");
if(yyparse()==0)
printf("valid expr");
return 0;
}
int yyerror(char *s)
{
printf("invalid expr");
return 0;
}
int yylex()
{
int c=getchar();
if(c>='a' && c<='z' || c>='A' && c<='Z')
{
return LETTER;
}
if(c>='0' && c<='9')
{
return NUM;
}
if(c=='\n')
return 0;

return c;
}


}
