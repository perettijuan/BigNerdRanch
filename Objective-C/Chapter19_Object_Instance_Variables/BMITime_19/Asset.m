//
//  Asset.m
//  BMITime_19
//
//  Created by Juan Pablo Peretti on 21/1/16.
//  Copyright (c) 2016 Juan Pablo Peretti. All rights reserved.
//

#import "Asset.h"

@implementation Asset

@synthesize label, resaleValue;

- (NSString *) description
{
    return [NSString stringWithFormat:@"<%@: $%d>", [self label], [self resaleValue]];
}

- (void) dealloc
{
    NSLog(@"dealloc %@", self);
}


@end
