//
//  Employee.m
//  BMITime_18
//
//  Created by Juan Pablo Peretti on 20/1/16.
//  Copyright (c) 2016 Juan Pablo Peretti. All rights reserved.
//

#import "Employee.h"

@implementation Employee

@synthesize employeeId;


- (float) bodyMassIndex
{
    float normalBMI = [super bodyMassIndex];
    // Re-calculate and resturn it
    return normalBMI * 0.9;
}

@end
