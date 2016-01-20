//
//  main.m
//  Challenge
//
//  Created by Juan Pablo Peretti on 20/1/16.
//  Copyright (c) 2016 Juan Pablo Peretti. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSString *coke = @"Coke";
        NSString *candy = @"Candy";
        NSString *water = @"Water";
        NSString *toiletPaper = @"Toilet paper";
        
        NSMutableArray *groceries = [NSMutableArray arrayWithObjects:coke, candy, water, toiletPaper, nil];
        
        for(NSString *grocery in groceries) {
            NSLog(@"Grocery is %@", grocery);
        }
        
        
    }
    return 0;
}
