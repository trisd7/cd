
#include <stdio.h>

int stack[100], top = -1;

void allocate(int x) {
    stack[++top] = x;
    printf("%d allocated\n", x);
}

void deallocate() {
    if (top == -1)
        printf("Stack is Empty\n");
    else
        printf("%d deallocated\n", stack[top--]);
}

void display() {
    int i;

    printf("Stack elements: ");
    for (i = top; i >= 0; i--)
        printf("%d ", stack[i]);

    printf("\n");
}

int main() {
    allocate(10);
    allocate(20);
    allocate(30);

    display();

    deallocate();

    display();

    return 0;
}
