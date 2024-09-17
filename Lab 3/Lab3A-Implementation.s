/*
    This code was written to support the book, "ARM Assembly for Embedded Applications",
    by Daniel W. Lewis. Permission is granted to freely share this software provided
    that this notice is not removed. This software is intended to be used with a run-time
    library adapted by the author from the STM Cube Library for the 32F429IDISCOVERY 
    board and available for download from http://www.engr.scu.edu/~dlewis/book3.
*/
        .syntax         unified
        .cpu            cortex-m4
        .text

// int32_t Add(int32_t a, int32_t b) ;
//adds together two inputted 32-bit integers(a and b)
        .global         Add
        .thumb_func
        .align
Add:
         ADD            R0,R0,R1 //adds the first and second parameters together
         BX             LR

// int32_t Less1(int32_t a) ;
//subtracts 1 from the inputted 32-bit integer a
        .global         Less1
        .thumb_func
        .align
Less1:
         SUB            R0,R0,1 //subtracts 1 from the inputted value
         BX             LR

// int32_t Square2x(int32_t x) ;
//returns the square of the sum of inputted 32-bit integer x and itself (square of x + x)
        .global         Square2x
        .thumb_func
        .align
Square2x:
         //Need to preserve R4 since it's a variable register
         //Need to preserve LR since a function call is made within this function
         PUSH           {R4,LR}
         ADD            R0,R0,R0 //adds the inputted parameter to itself
         BL             Square
         POP            {R4,PC} //restores value of R4 and ends the function

// int32_t Last(int32_t x) ;
//returns the sum of an inputted 32-bit integer x and the square root of x
        .global         Last
        .thumb_func
        .align
Last:
         //Need to preserve R4 since it's a variable register
         //Need to preserve LR since a function call is made within this function
         PUSH           {R4,LR}
         MOV            R4,R0 //keeps original parameter safe in R4
         BL             SquareRoot
         ADD            R0,R4,R0 //adds the value calculated in SquareRoot and the original value of x together
         POP            {R4,PC} //restores value of R4 and ends function

        .end


