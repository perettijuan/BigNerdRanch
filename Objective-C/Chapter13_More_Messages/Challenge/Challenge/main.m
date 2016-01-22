//
//  main.m
//  Challenge
//
//  Created by Juan Pablo Peretti on 19/1/16.
//  Copyright (c) 2016 Juan Pablo Peretti. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
       
        NSTimeZone *time = [[NSTimeZone alloc]init];
        BOOL isDayLight = [time isDaylightSavingTime];
        NSLog(@"Now is day light %s" , isDayLight ? "true" : "false" );
    }
    return 0;
}
