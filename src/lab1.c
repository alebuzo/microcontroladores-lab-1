#include <pic14/pic12f675.h>
#include <stdint.h>
#include <stdio.h>


typedef unsigned int word;
word __at 0x2007 __CONFIG = (_WDTE_OFF);

 
void delay (unsigned inttiempo);
uint8_t rotl(const uint8_t x, int k);
uint8_t next(void);
int rand(void);

void main(void)
{

    TRISIO = 0b00100000; //Poner todos los pines como salidas
	GPIO = 0x00; //Poner pines en bajo
 
    unsigned int time = 200;
    unsigned int random_num = 3;

    //Loop forever
    while ( 1 )
    {
		if (GP5) {
            
            
            switch (random_num)
            {
                case 1:
                { 
                    GP0 = 1;
			        delay(time);
			        GP0 = 0;
                    break;
                }

                case 2:
                { 
                    GP4 = 1;
			        delay(time);
			        GP4 = 0;
                    break;
                }

                case 3:
                { 
                    GPIO = 0b00010001;
			        delay(time);
                    GPIO = 0b00000000;
                    break;
                }

                case 4:
                { 
                    GPIO = 0b00010010;
			        delay(time);
                    GPIO = 0b00000000;
                    break;
                }

                case 5:
                {
                    GPIO = 0b00010011;
			        delay(time);
                    GPIO = 0b00000000;
                    break;
                }

                case 6:
                { 
                    GPIO = 0b00010110;
			        delay(time);
                    GPIO = 0b00000000;
                    break;
                }
                
            }
            random_num = rand();
		} else {
            GPIO = 0x00; 
		}
    }
 
}


void delay(unsigned int tiempo)
{
	unsigned int i;
	unsigned int j;

	for(i=0;i<tiempo;i++)
	  for(j=0;j<1275;j++);
}


uint8_t rotl(const uint8_t x, int k) {
    return (x << k) | (x >> (8 - k));
}

uint8_t s[2] = { 0, 0xA3 };

uint8_t next(void) {
    uint8_t s0 = s[0];
    uint8_t s1 = s[1];
    uint8_t result = s0 + s1;

    s1 ^= s0;
    s[0] = rotl(s0, 6) ^ s1 ^ (s1 << 1);
    s[1] = rotl(s1, 3);

    return result;
}

int rand(void) {
    int randi = 0;
    while (1) {
        randi = next();
        if (randi < 7 && randi > 0) {
           return randi;
        }
    }

}


