//
//  main.m
//  Degrees
//
//  Created by Juan Pablo Peretti on 19/1/16.
//  Copyright (c) 2016 Juan Pablo Peretti. All rights reserved.
//

#include <stdio.h>

float farenhetFromCelsius(float cel) {
    float farh = cel * 1.8 + 32;
    printf("%f Celsius is %f Farenheit.\n", cel, farh);
    return farh;
}

int main(int argc, const char * argv[]) {
    float freezeInC = 0;
    float freezeInF = farenhetFromCelsius(freezeInC);
    printf("Water freezes at %f degrees in Farenheit\n", freezeInF);
    return 0;
}
