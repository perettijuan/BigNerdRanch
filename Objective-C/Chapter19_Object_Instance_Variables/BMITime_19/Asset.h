//
//  Asset.h
//  BMITime_19
//
//  Created by Juan Pablo Peretti on 21/1/16.
//  Copyright (c) 2016 Juan Pablo Peretti. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Asset : NSObject
{
    NSString *label;
    unsigned int resaleValue;
}

@property (strong) NSString *label;
@property unsigned int resaleValue;

@end
