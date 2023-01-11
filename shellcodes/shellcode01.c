#include <unistd.h>
#include <stdlib.h>

void main(){
    execve("/bin/sh", NULL, NULL);
    exit(0);
}