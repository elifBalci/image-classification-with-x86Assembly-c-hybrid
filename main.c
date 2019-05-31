#include <stdio.h>
#include <stdlib.h>

extern int func(char *a);
unsigned char* image;

unsigned char* read_bmp(char* filename)
{
    int i;
    FILE* f = fopen(filename, "rb");
    unsigned char info[54];
    fread(info, sizeof(unsigned char), 54, f); // read the 54-byte header
    
    //BMP format control
    if(info[0] != 66 || info[1] != 77){
      printf("file is not in BMP format.");
      return 0;
    } 

    // extract image height and width from header
    int width = *(int*)&info[18];
    int height = *(int*)&info[22];
    int heightSign =1;
    if(height<0){
        heightSign = -1;
    }

    int size = 3 * width * abs(height);
    unsigned char* data = malloc(size); // allocate 3 bytes per pixel
    fread(data, sizeof(unsigned char), size, f); // read the rest of the data at once
    fclose(f);

    return data;
}

int main(void){
  image = read_bmp("ste-04.bmp");

  int result = func(image);
  return 0;
}
