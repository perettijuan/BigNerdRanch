//
//  main.m
//  Callbacks
//
//  Created by Juan Pablo Peretti on 22/1/16.
//  Copyright (c) 2016 Juan Pablo Peretti. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Logger.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        Logger *logger = [[Logger alloc] init];
        
        // Here we use the Timer as a Notification listener to listen events from the NotificationCenter
        [[NSNotificationCenter defaultCenter] addObserver:logger selector:@selector(zoneChange:) name:NSSystemTimeZoneDidChangeNotification object:nil];
        
        NSURL *url = [NSURL URLWithString:@"http://www.gutenberg.org/cache/epub/205/pg205.txt"];
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        
        // Here we use Logger as a "Helper Object" pattern. Note that, in order to do this,
        // the Logger class implements some methods of the protocol defined for the NSURLConnection class
        __unused NSURLConnection *fetchConn = [[NSURLConnection alloc]initWithRequest:request delegate:logger startImmediately:YES];
        
        // Here, we use logger as a "Target-action" pattern
        __unused NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:2.0 target:logger selector:@selector(sayOuch:) userInfo:nil repeats:YES];
        
        // Get the current Loop and make it run indefinetly
        [[NSRunLoop currentRunLoop] run];
        
    }
    return 0;
}
