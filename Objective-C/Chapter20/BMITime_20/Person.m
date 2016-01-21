//
//  Person.m
//  BMITime_19
//
//  Created by Juan Pablo Peretti on 21/1/16.
//  Copyright (c) 2016 Juan Pablo Peretti. All rights reserved.
//

#import "Person.h"

@implementation Person

@synthesize heightInMetters, weightInKilos;

- (float) bodyMassIndex
{
    return  weightInKilos / (heightInMetters * heightInMetters);
}

@end