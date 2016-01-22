//
//  Logger.m
//  Callbacks
//
//  Created by Juan Pablo Peretti on 22/1/16.
//  Copyright (c) 2016 Juan Pablo Peretti. All rights reserved.
//

#import "Logger.h"

@implementation Logger

- (void)sayOuch:(NSTimer *)t
{
    NSLog(@"Ouch");
}


// Helper Object implementation of protocols
// From the protocol defined for NSURLConnection

//Called each time a chunk of data arrives
-(void) connection:(NSURLConnection *)connection
    didReceiveData:(NSData *)data
{
    NSLog(@"Received %lu bytes", [data length]);
    
    //Create the data object if it doesn't exists
    if(!incomingData) {
        incomingData = [[NSMutableData alloc] init];
    }
    
    [incomingData appendData:data];
}

//Called when the last chunk has been processed
-(void) connectionDidFinishLoading:(NSURLConnection *) connection
{
    NSLog(@"Git it all!!");
    
    NSString *string = [[NSString alloc] initWithData:incomingData encoding:NSUTF8StringEncoding];
    incomingData = nil;
    
    NSLog(@"String has %lu characters", [string length]);
    NSLog(@"The whole string %@", string);
}


//Called if the fetch fails
-(void)connection:(NSURLConnection *) connection
didFailWithError:(NSError *)error
{
    NSLog(@"Connection failed %@", [error localizedDescription]);
    incomingData = nil;
}


// This method is the protocol for the notification center
-(void) zoneChange:(NSNotification *) note
{
    NSLog(@"The System zone has changed");
}

@end
