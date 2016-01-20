//
//  main.m
//  BMITime
//
//  Created by Juan Pablo Peretti on 20/1/16.
//  Copyright (c) 2016 Juan Pablo Peretti. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {

        // Create an instance of person
        Person *person = [[Person alloc]init];
        
        // Assing some values
        [person setHeightInMetters:1.79];
        [person setWeightInKilos:93];
        
        // Call the BMI method
        float bmi = [person bodyMassIndex];
        NSLog(@"Person (%d, %f) has a BMI of %f", [person weightInKilos], [person heightInMetters], bmi);
        
    }
    return 0;
}
