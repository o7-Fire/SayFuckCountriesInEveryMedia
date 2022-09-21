#include <time.h>
#include <string.h>
#include <stdio.h>
#include <unistd.h>

#include <stdlib.h>

#define bufferLength 255

FILE* file;
char buffer[bufferLength];


char* FUCKYOU(const char *buffer) {
  char *result = malloc(strlen("Fuck ") + strlen(buffer) + 1);
  strcpy(result, "Fuck ");
  strcat(result, buffer);
  return result;
}

void main() {
    file = fopen("countries.txt", "r");
    while(fgets(buffer, bufferLength, file)) {
    printf("%s", FUCKYOU(buffer));
    sleep(3);
  }
    fclose(file);
}
