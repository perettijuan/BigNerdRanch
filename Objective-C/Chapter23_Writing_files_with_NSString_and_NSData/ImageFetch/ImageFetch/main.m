//
//  main.m
//  ImageFetch
//
//  Created by Juan Pablo Peretti on 22/1/16.
//  Copyright (c) 2016 Juan Pablo Peretti. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
    
        NSURL *url = [NSURL URLWithString:@"http://www.google.com/images/logos/ps_logo2.png"];
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        NSError *error = nil;
        
        NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:NULL error:&error];
        
        if(!data) {
            NSLog(@"Fetch failed %@", [error localizedDescription]);
            return 1;
        }
        NSLog(@"The files is %lu bytes", [data length]);
        
        BOOL written = [data writeToFile:@"/temp/google.png" options:0 error:&error];
        
        if(!written) {
            NSLog(@"Failed to write %@", [error localizedDescription]);
            return 1;
        }
        
        NSLog(@"Success");
    
    }
    return 0;
}
