//
//  main.m
//  Turkey
//
//  Created by Juan Pablo Peretti on 18/1/16.
//  Copyright (c) 2016 Juan Pablo Peretti. All rights reserved.
//

#include <stdio.h>

int main(int argc, const char * argv[]) {
    
    float weight;
    weight = 14.2;
    printf("The turkey weighs %f. \n", weight);
    
    float cookingTime;
    // Calculate the cooking time and store it in the variable
    cookingTime = 15.0 + 15.0 * weight;
    printf("Cook it for %f minutes. \n", cookingTime);
     
    
    return 0;
}
