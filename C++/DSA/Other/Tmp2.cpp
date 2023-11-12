#include <stdio.h>
#include <stdalign.h>

struct my_struct {
    char c;
    int i;
};

int main(void) {
    printf("sizeof(char) = %zu\n", sizeof(char));
    printf("sizeof(int) = %zu\n", sizeof(int));
    printf("sizeof(struct my_struct) = %zu\n", sizeof(struct my_struct));
    printf("alignof(char) = %zu\n", alignof(char));
    printf("alignof(int) = %zu\n", alignof(int));
    printf("alignof(struct my_struct) = %zu\n", alignof(struct my_struct));
    return 0;
}
