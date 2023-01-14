#include <stdint.h>
#include <stdio.h>
int next = 250;

int rand ()
{
    
    while (1) { 
        //next = next * 1103515245 + 12345; 
        //unsigned int randi =  (next/65535) % 32768;
        //if (randi < 7 && randi > 0) {
            //return randi;
        //}
        

        //next = next * 11035245 + 1235; 
        //int randi =  (next/6535) % 7;
        //if (randi < 7 && randi > 0) {
        //  return randi;
        //}

        next = next * 1655 + 16; 
        int randi =  (next/6) % 7;
        //if (randi < 7 && randi > 0) {
           return randi;
        //}
    }
    //return (unsigned int) (next/65535) % 32768;
}

void main(void){
    int counter = 10;
    int randi = 0;
    while (counter > 0) { 
        randi = rand();
        printf("%u \n", randi);
        
        counter = counter -1;
        
    }

}