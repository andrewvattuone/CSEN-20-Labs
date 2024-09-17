#include <stdint.h>

uint32_t Bits2Unsigned(int8_t bits[8])
    {
    // To be implemented by student
    // Input:   bits[0] = Least significant bit
    //          bits[7] = Most significant bit
    // Output:  0 <= return value < 255
    uint32_t value ;
    int bit ;

    //Implementation
    value = 0;
    for(bit = 7; bit >= 0; bit--)
    {
        value = 2 * value + bits[bit];
    }

    return value ;
    }

int32_t Bits2Signed(int8_t bits[8])
    {
    // To be implemented by student
    // Input:   bits[0] = Least significant bit
    //          bits[7] = Most significant bit
    // Output: -128 <= return value <= +127
    int32_t value ;
    
    //Implementation
    value = 0;

    int bit;
    for(bit = 6; bit >= 0; bit--)
    {
        value = 2 * value + bits[bit];
    }

    if(bits[7] == 1)
    {
        value -= 128; 
    }

    return value ;
    }

void Increment(int8_t bits[8])
    {
    // To be implemented by student
    // Adds 1 to the number represented by bits
    // Where:   bits[0] = Least significant bit
    //          bits[7] = Most significant bit
    int32_t bit, carry, sum ;
    carry = 1 ;

    //Implementation
    for(bit = 0; bit < 8; bit++)
    {
        sum = carry + bits[bit];
        bits[bit] = sum % 2;
        carry = sum / 2;
    }
    }

void Unsigned2Bits(uint32_t n, int8_t bits[8])
    {
    // To be implemented by student
    // Input:   0 <= n <= 255
    // Output:  Converts n to an array of bits
    // Where:   bits[0] = Least significant bit
    //          bits[7] = Most significant bit
    int32_t bit ;

    //Implementation
    for(bit = 0; bit < 8; bit++)
    {
        bits[bit] = n % 2;
        n = n / 2;
    }
    }