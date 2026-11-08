
#include <stdio.h>

char s[100];
int i = 0;

int main()
{
    printf("Enter a string: ");
    scanf("%99s", s);

    if(s[i++] == 'c')
    {
        if(s[i] == 'a' && s[i+1] == 'b')
            i = i + 2;
        else if(s[i] == 'a')
            i++;

        else
        {
            printf("Invalid String");
            return 0;
        }

        if(s[i++] == 'd' && s[i] == '\0')
            printf("Valid String");
        else
            printf("Invalid String");
    }
    else
        printf("Invalid String");

    return 0;
}
