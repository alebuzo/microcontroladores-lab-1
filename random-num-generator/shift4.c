#include <stdint.h>
#include <stdio.h>


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

    return (result % 10);
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

void main(void){
    int counter = 10;
    int randi = 0;
    while (counter > 0) { 
        randi = rand();
        switch (randi)
            {
                case 1:
                { 
                    printf("caso 1");
                }

                case 2:
                { 
                    printf("caso 2");
                }

                case 3:
                { 
                    printf("caso 3");
                }

                case 4:
                { 
                    printf("caso 4");
                }

                case 5:
                { 
                    printf("caso 5");
                }

                case 6:
                { 
                    printf("caso 6");
                }
            }
        
        counter = counter -1;
        
    }

}