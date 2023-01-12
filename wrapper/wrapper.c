#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <unistd.h>

int main(int argc, char *argv[]){
    if(argc < 2)
        printf("error");
        return 1;

    char *shellcode = argv[1];

    size_t shellcode_len = strlen(shellcode);
    printf("Shellcode size (bytes) : %ld\n", shellcode_len);

    //execution shell code
    int (*ret)() = (int(*)())shellcode;

    ret();

    return 0;

}