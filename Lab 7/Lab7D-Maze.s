/*
    This code was written to support the book, "ARM Assembly for Embedded Applications",
    by Daniel W. Lewis. Permission is granted to freely share this software provided
    that this notice is not removed. This software is intended to be used with a run-time
    library adapted by the author from the STM Cube Library for the 32F429IDISCOVERY 
    board and available for download from http://www.engr.scu.edu/~dlewis/book3.
*/
        .syntax     unified
        .cpu        cortex-m4
        .text

// void PutNibble(void *nibbles, uint32_t index, uint32_t nibble) ;

        .global     PutNibble
        .thumb_func
        .align

PutNibble:
        LSRS        R1,R1,1             // R1 = byte offset; C = which (0 or 1)
        LDRB        R3,[R0,R1]          // R3 = byte containing nibble
        ITTE CS                         // Checks to see if carry equals 1
        ANDCS       R3,R3,0b00001111    // Clears the top if carry equals 1
        LSLCS       R2,R2,4             // Then shifts top to the left by 4 bits if carry equals 1   
        ANDCC       R3,R3,0b11110000    // Otherwise top is kept the same, and bottom is set to 0
        ORR         R3,R3,R2            // Sets the bits(top or bottom depending on the carry value) equal to value
        STRB        R3,[R0,R1]          // Store byte containing nibble
        BX          LR

// uint32_t GetNibble(void *nibbles, uint32_t index) ;

        .global     GetNibble
        .thumb_func
        .align

GetNibble:
        LSRS        R1,R1,1             // R1 = byte offset; C = which (0 or 1)
        LDRB        R0,[R0,R1]          // R0 = byte containing nibble
        IT CS                           // Checks if carry equals 1
        LSRCS       R0,R0,4             // Shift byte right 4 bits if need most-significant nibble
        AND         R0,R0,0b00001111    // Strip other bits
        BX          LR

        .end
