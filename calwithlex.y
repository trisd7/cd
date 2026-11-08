%{

#include<stdio.h>

int yyerror(char *s);
int yylex();

%}

%token NUM
%left '+''-'
%left '*''/'

%%

S:E {printf("result=%d\n",$1);}
 ;

E:E '+' E {$$=$1+$3;}
 |E '-' E {$$=$1-$3;}
 |E '*' E {$$=$1*$3;}
 |E '/' E {$$=$1/$3;}
 |NUM {$$=$1;}
 ;

%%

int main()
{
printf("enter expression:\n");
yyparse();
printf("valid expression");
return 0;
}
int yyerror(char *s)
{
printf("invalid");
return 0;
}

