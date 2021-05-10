#include <stdio.h>
#include <stdlib.h>

extern int food(char *a);
unsigned char* image;
int offset = 36;
int bmp_file_size = 120054;

unsigned char* read_bmp(char* filename)
{
    int i;
    FILE* f = fopen(filename, "rb");
    unsigned char info[54];
    fread(info, sizeof(unsigned char), 54, f); // read the 54-byte header
    
    //BMP format control
    if(info[0] != 66 || info[1] != 77){
      printf("file is not in BMP format.\n");
      exit(0);
    } 

    int size = (bmp_file_size - offset)/3;

    unsigned char* data = malloc(size); // allocate 3 bytes per pixel
    fread(data, sizeof(unsigned char), size, f); // read the rest of the data at once
    fclose(f);

    return data;
}

int main(void){
  image = read_bmp("cur-02.bmp");

  int result = food(image);
  return 0;
}
