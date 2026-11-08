
#include <stdio.h>

char s[100];
int i = 0, error = 0;

void S();
void L();

void S()
{
    if(s[i] == 'a')
        i++;

    else if(s[i] == '(')
    {
        i++;
        L();

        if(s[i] == ')')
            i++;
        else
            error = 1;
    }
    else
        error = 1;
}

void L()
{
    S();

    while(s[i] == ',' && !error)
    {
        i++;
        S();
    }
}

int main()
{
    printf("Enter string: ");
    scanf("%99s", s);

    S();

    if(error == 0 && s[i] == '\0')
        printf("Valid String");
    else
        printf("Invalid String");

    return 0;
}
