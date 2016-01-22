//
//  Employee.m
//  BMITime_19
//
//  Created by Juan Pablo Peretti on 21/1/16.
//  Copyright (c) 2016 Juan Pablo Peretti. All rights reserved.
//

#import "Employee.h"
#import "Person.h"
#import "Asset.h"

@implementation Employee

@synthesize employeeId;


- (float) bodyMassIndex
{
    float normalBMI = [super bodyMassIndex];
    // Re-calculate and resturn it
    return normalBMI * 0.9;
}


-(void) addAssetsObject:(Asset *)a
{
    // is assets nil?
    if(!assets) {
        // Create the array
        assets = [[NSMutableArray alloc] init];
    }
    
    [assets addObject:a];
}

-(unsigned int) valueOfAssets
{
    // Sum up the resale value of the assets
    unsigned int sum = 0;
    for (Asset *a in assets) {
        sum += [a resaleValue];
    }
    return sum;
}

-(NSString *) description
{
    return [NSString stringWithFormat:@"<Employee %d: $%d in assets>", [self employeeId], [self valueOfAssets]];
}

-(void) dealloc
{
    NSLog(@"Deallocating %@", self);
}

@end
