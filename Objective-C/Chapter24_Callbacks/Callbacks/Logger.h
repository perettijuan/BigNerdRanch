//
//  Logger.h
//  Callbacks
//
//  Created by Juan Pablo Peretti on 22/1/16.
//  Copyright (c) 2016 Juan Pablo Peretti. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Logger : NSObject
{
    NSMutableData *incomingData;
}

- (void)sayOuch:(NSTimer *)t;

@end
