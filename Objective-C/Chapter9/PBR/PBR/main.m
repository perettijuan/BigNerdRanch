//
//  main.m
//  PBR
//
//  Created by Juan Pablo Peretti on 19/1/16.
//  Copyright (c) 2016 Juan Pablo Peretti. All rights reserved.
//

#include <stdio.h>
#include <math.h>

/*
 * This function will convert a point in the Cartessian coordinates system to Polar coordinates.
 * NOTE that as we need to values to return the result (theta and radius), the function receives
 * two additional parameters: the pointers to a memory space where the values of theta and radius
 * will be stored.
 */
void cartesianToPolar(float x, float y, double *rPtr, double *thetaPtr) {
    
    // Check for non null reference to a pointer
    if(rPtr) {
        // Store the radius in the supplied address
        *rPtr = sqrt(x * x + y * y);
    }

    // Check for non null reference to the other pointer
    if(!thetaPtr) {
        // Skip the rest of the function
        return;
    }
    
    // Calculate theta
    float theta;
    if(x == 0.0) {
        if(y == 0.0) {
            theta = 0.0;
        } else if (y > 0) {
            theta = M_PI_2;
        } else {
            theta = - M_PI_2;
        }
    } else {
        theta = atan(y/x);
    }
    
    //Store theta in the supplied address
    *thetaPtr = theta;
    
}



int main(int argc, const char * argv[]) {
    double pi = 3.14;
    double interegrPart;
    double fractionPart;
    
    // Pass the address of integerPart as an argument, the function
    // modf from math lib will store the integer part of the number
    // in that address and will return the fraction part of the number
    fractionPart = modf(pi, &interegrPart);
    
    // Find the value stored in integrPart
    printf("integerPart = %.0f, fractionPart = %.2f\n", interegrPart, fractionPart);
    
    double x = 3.0;
    double y = 4.0;
    
    double radius;
    double angle;
    cartesianToPolar(x, y, &radius, &angle);
    
    printf("(%.2f, %.2f) becomes (%.2f radians, %.2f)\n", x, y, radius, angle);
    
    return 0;
}
