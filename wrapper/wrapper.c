#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <unistd.h>

int main(int argc, char *argv[]) {
  // Controle du nombre d'arguments
  if (argc < 2) {
    printf("Usage: %s <shellcode>\n", argv[0]);
    return 1;
  }
  
  char *shellcode = argv[1];
  
  // Affichage de la taille du shellcode
  size_t shellcode_len = strlen(shellcode);
  printf("Shellcode size: %ld\n", shellcode_len);

  // Affichage du shellcode
  printf("Shellcode: ");
  for (size_t i = 0; i < shellcode_len; i++) {
    printf("\\x%02x", (unsigned char)shellcode[i]);
  }
  printf("\n");

  // Execution du shellcode
  printf("Executing shellcode...\n");
  int (*func)();
  func = (int (*)()) shellcode;
  (int)(*func)();

  return 0;
}