#include <stdint.h>
#include <stdio.h>
/*unsigned lfsr_xorshift(void)
{
    uint16_t start_state = 0xACE1u;  // Any nonzero start state will work. //
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
} */

unsigned lfsr_galois(void)
{
    uint16_t start_state = 0xACE1u;  /* Any nonzero start state will work. */
    uint16_t lfsr = start_state;
    unsigned period = 0;

    do
    {
#ifndef LEFT
        unsigned lsb = lfsr & 1u;  /* Get LSB (i.e., the output bit). */
        lfsr >>= 1;                /* Shift register */
        if (lsb)                   /* If the output bit is 1, */
            lfsr ^= 0xB400u;       /*  apply toggle mask. */
#else
        unsigned msb = (int16_t) lfsr < 0;   /* Get MSB (i.e., the output bit). */
        lfsr <<= 1;                          /* Shift register */
        if (msb)                             /* If the output bit is 1, */
            lfsr ^= 0x002Du;                 /*  apply toggle mask. */
#endif
        ++period;
    }
    while (lfsr != start_state);

    return period;
}

void main(void){
    int counter = 100;
    int rand = 0;
    while (counter > 0) { 
        //rand = lfsr_xorshift();
        rand = lfsr_galois();
        printf("%u", rand);
        counter = counter -1;
    }
    


}