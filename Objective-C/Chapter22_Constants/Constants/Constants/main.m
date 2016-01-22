//
//  main.m
//  Constants
//
//  Created by Juan Pablo Peretti on 21/1/16.
//  Copyright (c) 2016 Juan Pablo Peretti. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        // In literal NSString, use \u for arbitrary unicode chars
        NSLog(@"\u03c0 is %f", M_PI);
        NSLog(@"%d is larger", MAX(10, 12));
        
        NSLocale *here = [NSLocale currentLocale];
        NSString *currency = [here objectForKey:NSLocaleCurrencyCode];
        NSLog(@"Money is in %@", currency);
        
    }
    return 0;
}
