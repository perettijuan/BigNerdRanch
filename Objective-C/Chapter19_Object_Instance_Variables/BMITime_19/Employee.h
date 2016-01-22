//
//  Employee.h
//  BMITime_19
//
//  Created by Juan Pablo Peretti on 21/1/16.
//  Copyright (c) 2016 Juan Pablo Peretti. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
@class Asset;

@interface Employee : Person
{
    int employeeId;
    NSMutableArray *assets;
}

@property int employeeId;
-(void) addAssetsObject:(Asset *)a;
-(unsigned int) valueOfAssets;

@end
