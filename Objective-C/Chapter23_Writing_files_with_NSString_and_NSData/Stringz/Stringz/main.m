//
//  main.m
//  Stringz
//
//  Created by Juan Pablo Peretti on 21/1/16.
//  Copyright (c) 2016 Juan Pablo Peretti. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSMutableString *str = [[NSMutableString alloc] init];
        for(int i = 0; i < 10; i++){
            [str appendString:@"Juan is cool!\n"];
        }
        
        // Declare a pointer to an NSError object, but don't instantiate it.
        // The NSError instance will only be created if there is, in fact, an error.
        NSError *error = nil;
        
        BOOL success = [str writeToFile:@"/to/darned.txt" atomically:YES encoding:NSUTF8StringEncoding error:&error];
        
        if(success) {
            NSLog(@"Done writing /to/darned.txt");
        } else {
            NSLog(@"Error writing file: %@", [error localizedDescription]);
        }
        
    }
    return 0;
}
