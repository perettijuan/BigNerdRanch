//
//  Person.h
//  BMITime_18
//
//  Created by Juan Pablo Peretti on 20/1/16.
//  Copyright (c) 2016 Juan Pablo Peretti. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
{
    //Instance variables
    float heightInMetters;
    int weightInKilos;
}

@property float heightInMetters;
@property int weightInKilos;

// Calculates the Body Mass Index
- (float) bodyMassIndex;

@end
