//
//  Appliance.m
//  Appliances
//
//  Created by Juan Pablo Peretti on 25/1/16.
//  Copyright (c) 2016 Juan Pablo Peretti. All rights reserved.
//

#import "Appliance.h"

@implementation Appliance

@synthesize productName, voltage;


/*
 * This is the standard initializer method (or constructor). It can never receive parameters, therefore,
 * constructor overloading doesn't exists.
 */
-(id) init
{
    // This solves the problem of a client calling the init method when we need to force the creation
    // of every instance variable.
    return [self initWithProductName:@"Unknown"];
}


/*
 * This is what we can interpret as a "overloaded constructor": a method that receives a parameter
 * and returns a pointer to itself. In the method, the initialization process is done.
 */
-(id) initWithProductName:(NSString *)pn
{
    // First, call the NSObject init method
    self = [super init];
    
    // Notice that, according to the book, the init method of the superclass can fail
    if(self) {
        productName = pn;
        
        // Give voltage a given value
        voltage = 120;
    }
    
    // Return the pointer to the newly created instance
    return self;
}

/*
 * This is like the "toString" method in java.
 */
-(NSString *) description
{
    return [NSString stringWithFormat:@"<%@: %d volts", productName, voltage];
}

@end
