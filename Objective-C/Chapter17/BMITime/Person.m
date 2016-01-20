//
//  Person.m
//  BMITime
//
//  Created by Juan Pablo Peretti on 20/1/16.
//  Copyright (c) 2016 Juan Pablo Peretti. All rights reserved.
//

#import "Person.h"

@implementation Person

// in the implementation, if we're using the @property annotation, we use the @synthetize annotation

@synthesize heightInMetters, weightInKilos;

/*- (void) setHeightInMetters:(float)h
{
    heightInMetters = h;
}

- (void) setWeightInKilos:(int)w
{
    weightInKilos = w;
}

- (float) heightInMetters
{
    return heightInMetters;
}

- (int) weightInKilos
{
    return weightInKilos;
}
*/



- (float) bodyMassIndex
{
    return  weightInKilos / (heightInMetters * heightInMetters);
}

@end
