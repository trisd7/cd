
%{
#include<ctype.h>
#include<stdio.h>
#include<string.h>
#include<stdlib.h>
int yyerror(char *s);
int yylex();

struct node{
char data;
struct node *left;
struct node *right;
};
struct node *root;

struct node *create(char c,struct node *l, struct node *r)
{
struct node *p=malloc(sizeof(struct node));
p->data=c;
p->left=l;
p->right=r;
return p;
}
void display(struct node *p,int level)
{
if(p==NULL)return;
display(p->right,level+1);
for(int i=0;i<level;i++)
printf("  ");
printf("%c\n",p->data);
display(p->left,level+1);
}
%}

%union
{
struct node *ptr;
}

%token<ptr> NUM
%type<ptr> E

%left '+' '-'
%right '*' '/'


%%
S:E{root=$1;}
 ;
E:E '+' E {$$=create('+',$1,$3);}
 |E '-' E {$$=create('-',$1,$3);}
 |E '*' E {$$=create('*',$1,$3);}
 |E '/' E {$$=create('/',$1,$3);}
 | NUM {$$=$1;}
 ;

%%

int main()
{
printf("enter expression:");
if(yyparse()==0)
display(root,0);
return 0;
}
int yyerror(char *s)
{
printf("invalid expr");
return 0;
}


int yylex()
{
char c;
c=getchar();
if(c>='0' && c<='9')
{
yylval.ptr=create(c,NULL,NULL);
return NUM;
}
if(c=='\n')
return 0;

return c;
}
