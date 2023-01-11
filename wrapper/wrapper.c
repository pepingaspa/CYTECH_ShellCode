#include <stdio.h>
#include <string.h>
#include <sys/mman.h>

int main(int argc, char *argv[]) {
    if (argc != 2) {
        return 1;
    }
    size_t len = strlen(argv[1]) / 2;
    printf("Taille du shellcode : %s", len);
    unsigned char* shellcode = mmap(NULL, len, PROT_EXEC | PROT_WRITE | PROT_READ, MAP_ANONYMOUS | MAP_PRIVATE, 0, 0);
    if (shellcode == MAP_FAILED) {
        printf("mmap failed\n");
        return 1;
    }
    for (int i = 0; i < len; i++) {
        sscanf(argv[1] + (i * 2), "%2hhx", &shellcode[i]);
    }
    int (*func)() = (int (*)()) shellcode;
    func();
    munmap(shellcode, len);
    return 0;
}