//
//  main.m
//  Challenge
//
//  Created by Juan Pablo Peretti on 19/1/16.
//  Copyright (c) 2016 Juan Pablo Peretti. All rights reserved.
//

#include <stdio.h>

// This is like a private variable declaration, it is not a constant
static float INTERIOR_ANGLE = 180;

float remainingAngle(float angleA, float angleB) {
    if(angleA < 0 || angleB < 0) {
        printf("The angles can not be negative");
        return 0;
    }
    
    float remaining = INTERIOR_ANGLE - angleA - angleB;
    return remaining;
    
}

int main(int argc, const char * argv[]) {
    float angleA = 30.0;
    float angleB = 60.0;
    float angleC = remainingAngle(angleA, angleB);
    printf("The third angle is %.2f\n", angleC);
    
    return 0;
}
