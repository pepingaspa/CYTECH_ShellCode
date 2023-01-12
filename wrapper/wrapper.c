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

    printf("Shellcode : ");
    for (size_t i = 0; i < shellcode_len; i++){
        printf("\\x%02x", (unsigned char)shellcode[i]);
    }
    printf("\n");

    printf("Schellcode execution");
    int (*func)();
    func = (int (*)()) shellcode;
    (int)(*func)();
    
    return 0;
}