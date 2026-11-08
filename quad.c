#include <stdio.h>
#include <string.h>
#include <ctype.h>

char s[100], temp[100][20];
int i=0, t=0, n=0;

char *save(char x[]) {
    strcpy(temp[n],x);
    return temp[n++];
}

char *gen(char op[], char *a, char *b) {
    char x[20];
    sprintf(x,"t%d",++t);

    char *r=save(x);

    printf("%s\t%s\t%s\t%s\n",op,a,b,r);
    return r;
}

char *E();

char *F() {
    char x[20];
    int j=0;

    if(s[i]=='-') {
        i++;
        return gen("UMINUS",F(),"-");
    }

    if(s[i]=='(') {
        i++;
        char *a=E();
        i++;
        return a;
    }

    while(isalnum(s[i]))
        x[j++]=s[i++];

    x[j]='\0';
    return save(x);
}

char *T() {
    char *a=F();

    while(s[i]=='*' || s[i]=='/') {
        char op[2]={s[i++],'\0'};
        a=gen(op,a,F());
    }

    return a;
}

char *E() {
    char *a=T();

    while(s[i]=='+' || s[i]=='-') {
        char op[2]={s[i++],'\0'};
        a=gen(op,a,T());
    }

    return a;
}

int main() {
    char lhs[20];
    int j=0;

    printf("Enter expression: ");
    scanf("%99s",s);

    while(isalpha(s[i]))
        lhs[j++]=s[i++];

    lhs[j]='\0';
    i++;

    printf("\nOperator\tArg1\tArg2\tResult\n");

    char *r=E();

    printf("=\t\t%s\t-\t%s\n",r,lhs);

    return 0;
}
