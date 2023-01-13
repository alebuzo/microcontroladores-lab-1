#include <pic14/pic12f675.h>
#include <stdint.h>
#include <stdio.h>
//int next = 250;

typedef unsigned int word;
word __at 0x2007 __CONFIG = (_MCLRE_OFF&_WDTE_OFF);

 
//To compile:
//sdcc -mpic14 -p16f675 blink.c
 
//To program the chip using picp:
//Assuming /dev/ttyUSB0 is the serial port.
 
//Erase the chip:
//picp /dev/ttyUSB0 16f887 -ef
 
//Write the program:
//picp /dev/ttyUSB0 16f887 -wp blink.hex
 
//Write the configuration words (optional):
//picp /dev/ttyUSB0 16f887 -wc 0x2ff4 0x3fff
 
//Doing it all at once: erasing, programming, and reading back config words:
//picp /dev/ttyUSB0 16f887 -ef -wp blink.hex -rc
 
//To program the chip using pk2cmd:
//pk2cmd -M -PPIC16f887 -Fblink.hex
 
void delay (unsigned inttiempo);
//int rand ();
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
                    //GP4 = 1;
                    //GP0 = 1;
			        delay(time);
			        //GP4 = 0;
                    //GP0 = 0;
                    GPIO = 0b00000000;
                    break;
                }

                case 4:
                { 
                    GPIO = 0b00010010;
                    //GP4 = 1;
                    //GP1 = 1;
			        delay(time);
			        //GP4 = 0;
                    //GP1 = 0;
                    GPIO = 0b00000000;
                    break;
                }

                case 5:
                {
                    GPIO = 0b00010011;
                    //GP4 = 1;
                    //GP1 = 1;
                    //GP0 = 1;
			        delay(time);
			        //GP4 = 0;
                    //GP1 = 0;
                    //GP0 = 0;
                    GPIO = 0b00000000;
                    break;
                }

                case 6:
                { 
                    GPIO = 0b00010110;
                    //GP4 = 1;
                    //GP1 = 1;
                    //GP2 = 1;
			        delay(time);
			        //GP4 = 0;
                    //GP1 = 0;
                    //GP2 = 0;
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

/*int rand ()
{
    
    while (1) { 
        next = next * 11035245 + 1235; 
        int randi =  (next/6535) % 7;
        if (randi < 7 && randi > 0) {
            return randi;
        }
        
    }
    //return (unsigned int) (next/65535) % 32768;
}*/

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


