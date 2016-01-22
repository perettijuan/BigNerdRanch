//
//  main.m
//  BMITime_18
//
//  Created by Juan Pablo Peretti on 20/1/16.
//  Copyright (c) 2016 Juan Pablo Peretti. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Employee.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        Employee *person = [[Employee alloc] init];
        
        [person setWeightInKilos:96];
        [person setHeightInMetters:1.8];
        [person setEmployeeId:15];
        
        // Call the bodyMassIndex method
        float bmi = [person bodyMassIndex];
        NSLog(@"Employee %d has a BMI of %f", [person employeeId], bmi);
        
    }
    return 0;
}
