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
        
        NSDateComponents *comps = [[NSDateComponents alloc] init];
        [comps setYear:1984];
        [comps setMonth:2];
        [comps setDay:5];
        [comps setHour:16];
        [comps setMinute:0];
        [comps setSecond:0];
        
        NSCalendar *g = [[NSCalendar alloc]initWithCalendarIdentifier:NSGregorianCalendar];
        
        NSDate *dateOfBirth = [g dateFromComponents: comps];
        NSDate *now = [NSDate date];
        
        double difference = [now timeIntervalSinceDate:dateOfBirth];
        
        NSLog(@"The difference between my brthdate and today is %f", difference);
        
    }
    return 0;
}
