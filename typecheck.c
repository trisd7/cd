#include <stdio.h>
#include <string.h>
int main()
{
    char t1[10], t2[10];
    char op;
    printf("Enter first data type (int/float/char): ");
    scanf("%9s", t1);

    printf("Enter operator (+, -, *, /, =): ");
    scanf(" %c", &op);

    printf("Enter second data type (int/float/char): ");
    scanf("%9s", t2);

    if ((strcmp(t1, "int") != 0 &&
         strcmp(t1, "float") != 0 &&
         strcmp(t1, "char") != 0) ||
        (strcmp(t2, "int") != 0 &&
         strcmp(t2, "float") != 0 &&
         strcmp(t2, "char") != 0))
    {
        printf("Invalid data type\n");
    }
    else if (op == '+' || op == '-' ||
             op == '*' || op == '/')
    {
        if (strcmp(t1, "char") == 0 ||
            strcmp(t2, "char") == 0)
        {
            printf("Type Error\n");
        }
        else
        {
            printf("Valid Operation\n");
        }
    }
    else if (op == '=')
    {
        if (strcmp(t1, t2) == 0)
            printf("Valid Assignment\n");
        else
            printf("Type Error\n");
    }
    else
    {
        printf("Invalid Operator\n");
    }
    return 0;
}
