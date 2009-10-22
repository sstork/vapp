int main(void){
  int value;
  int *buffer;
  int i = 0;

  buffer = malloc(1024*1024*sizeof(int));

  printf("HelloWorld\n");

  for ( i = 0 ; i < 1024*1024 ; i++ ) {
    buffer[i] = value;
  }

  return buffer[0];
}
