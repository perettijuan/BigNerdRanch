//
//  Person.h
//  BMITime
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
    //Setters methods
    // - (void) setHeightInMetters:(float)h;
    // - (void) setWeightInKilos:(int)w;

    //Getters methods
    // - (float) heightInMetters;
    // - (int) weightInKilos;

    // we can replace the accessor methods with the @property annotation
    @property float heightInMetters;
    @property int weightInKilos;

    // Calculates the Body Mass Index
    - (float) bodyMassIndex;

@end
