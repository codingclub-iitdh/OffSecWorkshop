#include<stdio.h>

void func1() {
    char str[1];
    printf("Enter your string: ");
    scanf("%s", str);
    printf("You entered %s\n", str);
}

void func2() {
    printf("Woah! You just exploited a stack overflow!\n");
}

int main() {
    func1();
    return 0;
}

