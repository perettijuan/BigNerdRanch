//
//  Asset.m
//  BMITime_19
//
//  Created by Juan Pablo Peretti on 21/1/16.
//  Copyright (c) 2016 Juan Pablo Peretti. All rights reserved.
//

#import "Asset.h"
#import "Employee.h"

@implementation Asset

@synthesize label, resaleValue, holder;

- (NSString *) description
{
    // Is holder non-nil?
    if([self holder]) {
        return [NSString stringWithFormat:@"<%@: $%d, assigned to %@>",
                [self label], [self resaleValue], [self holder]];
    } else {
        return [NSString stringWithFormat:@"<%@: $%d>", [self label], [self resaleValue]];    
    }
}

- (void) dealloc
{
    NSLog(@"dealloc %@", self);
}


@end
