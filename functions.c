// This file provides sample functions to call using our yacc grammars as a proof of concept

#include <stdio.h>


void testA(){
    printf("Test A!\n");
}

void testB(int n){
    printf("Test B\n N was: %i\n", n);
}

void testC(char* s){
    printf("Test C\n String was \"%s\"\n",s);
}