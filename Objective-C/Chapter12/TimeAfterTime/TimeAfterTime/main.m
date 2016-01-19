//
//  main.m
//  TimeAfterTime
//
//  Created by Juan Pablo Peretti on 19/1/16.
//  Copyright (c) 2016 Juan Pablo Peretti. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        // send a message to the NSDate class - the message is date (it creates an instance of
        // NSDate and returns the address where the new object starts
        NSDate *now = [NSDate date];
        NSLog(@ "The new date lives at %p", now);
        NSLog(@ "The date is %@", now);
        
        // Now, send a message to the object created
        double seconds = [now timeIntervalSince1970];
        NSLog(@"It has been %f seconds since  the start of 1970", seconds);
        
        // Send a message to the object telling it to create a new instance
        // with a difference of time - note the argument passing
        NSDate *later = [now dateByAddingTimeInterval:100000];
        NSLog(@"In 100,000 seconds it will be %@", later);
    }
    return 0;
}
