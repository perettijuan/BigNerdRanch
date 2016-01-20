//
//  main.m
//  DateList
//
//  Created by Juan Pablo Peretti on 20/1/16.
//  Copyright (c) 2016 Juan Pablo Peretti. All rights reserved.
//

#import <Foundation/Foundation.h>


void useMutableFromArray(NSArray *array) {
    
    if(array == nil) {
        return;
    }
    
    NSMutableArray *mutableList = [NSMutableArray array];
    
    NSUInteger count = [array count];
    for(int i = 0; i < count; i++) {
        [mutableList addObject:[array objectAtIndex:i]];
    }
    
    count = [mutableList count];
    for(int i = 0; i < count; i++) {
        NSLog(@"The object in position %i is %@", i, [mutableList objectAtIndex:i]);
    }
    
    
    // Remove the first item
    [mutableList removeObjectAtIndex:0];
    
    count = [mutableList count];
    for(int i = 0; i < count; i++) {
        NSLog(@"The object in position %i is %@", i, [mutableList objectAtIndex:i]);
    }
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // Create three NSDate objects to store them in an Array
        NSDate *now = [NSDate date];
        NSDate *tomorrow = [now dateByAddingTimeInterval:24.0 * 60.0 * 60.0];
        NSDate *yesterday = [now dateByAddingTimeInterval:-24.0 * 60 * 60];
        
        // Create an array containing all three pointers to the objects
        NSArray *dateList = [NSArray arrayWithObjects:now, tomorrow, yesterday, nil];
        
        
        // How many dates are
        NSLog(@"There are %lu dates", [dateList count]);
        
        // Print a couple
        NSLog(@"The first date is %@", [dateList objectAtIndex:0]);
        NSLog(@"The second date is %@", [dateList objectAtIndex:1]);
        
        
        // Print all of them by looping
        NSUInteger count = [dateList count];
        for(int i = 0; i < count; i++) {
            NSDate *d = [dateList objectAtIndex:i];
            NSLog(@"The date in position %i is %@", i, d);
        }
        
        
        // A for each way
        for(NSDate * d in dateList) {
            NSLog(@"The date is %@", d);
        }
        
        useMutableFromArray(dateList);
        
    }
    return 0;
}
