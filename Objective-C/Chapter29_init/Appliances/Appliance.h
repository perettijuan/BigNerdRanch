//
//  Appliance.h
//  Appliances
//
//  Created by Juan Pablo Peretti on 25/1/16.
//  Copyright (c) 2016 Juan Pablo Peretti. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Appliance : NSObject
{
    NSString *productName;
    int voltage;
}

// nonatomic is a modifier to make the setter and getter a little bit faster in non-multithread environments
@property (copy, nonatomic) NSString *productName;
@property (nonatomic) int voltage;

// The designated initializer
-(id) initWithProductName:(NSString *) pn;

@end
