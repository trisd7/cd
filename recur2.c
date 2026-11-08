
#include <stdio.h>
#include <ctype.h>

char s[100];
int i = 0, error = 0;

void E();
void T();
void F();

void E()
{
    T();

    while(s[i] == '+')
    {
        i++;
        T();
    }
}

void T()
{
    F();

    while(s[i] == '*')
    {
        i++;
        F();
    }
}

void F()
{
    if(isalpha(s[i]))
        i++;

    else if(s[i] == '(')
    {
        i++;
        E();

        if(s[i] == ')')
            i++;
        else
            error = 1;
    }
    else
        error = 1;
}

int main()
{
    printf("Enter expression: ");
    scanf("%99s", s);

    E();

    if(error == 0 && s[i] == '\0')
        printf("Valid Expression");
    else
        printf("Invalid Expression");

    return 0;
}
