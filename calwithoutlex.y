
%{
#include<stdio.h>
int yylex();
int yyerror(char *s);
%}
%token NUM
%left '+' '-'
%left '*' '/'
%%
S:E {printf("result:%d\n",$1);}
 ;
E:E '+' E {$$=$1+$3;}
 |E'-'E   {$$=$1-$3;}
 |E '*'E  {$$=$1*$3;}
 |E '/' E {$$=$1/$3;}
 |NUM     {$$=$1;}
 ;
%%
int main()
{
printf("enter to be computed:");
yyparse();
return 0;
}
int yyerror(char *s)
{
printf("invalid");
return 0;
}
int yylex()
{
int n,c;
c=getchar();

if(c>='0' && c<='9')
    {
        ungetc(c,stdin);
        scanf("%d",&n);
        yylval=n;
       return NUM;

   }
if(c=='\n')
return 0;

return c;
}



  
}
