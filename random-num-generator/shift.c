#include <stdint.h>
#include <stdio.h>
unsigned lfsr_xorshift(void)
{
    uint16_t start_state = 0xACE1u;  /* Any nonzero start state will work. */
    uint16_t lfsr = start_state;
    unsigned period = 0;

    do
    {   // 7,9,13 triplet from http://www.retroprogramming.com/2017/07/xorshift-pseudorandom-numbers-in-z80.html
        lfsr ^= lfsr >> 7;
        lfsr ^= lfsr << 9;
        lfsr ^= lfsr >> 13;
        ++period;
    }
    while (lfsr != start_state);

    return period;
}

void main(void){
    int counter = 10;
    int rand = 0;
    while (counter > 0) { 
        rand = lfsr_xorshift();
        printf("%u", rand);
        counter = counter -1;
    }
    


}