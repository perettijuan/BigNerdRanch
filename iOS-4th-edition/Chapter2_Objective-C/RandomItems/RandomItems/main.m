//
//  main.m
//  RandomItems
//
//  Created by Juan Pablo Peretti on 28/1/16.
//  Copyright (c) 2016 Juan Pablo Peretti. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Item.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        
        NSMutableArray *items = [[NSMutableArray alloc] init];
        
        [items addObject:@"One"];
        [items addObject:@"Two"];
        [items addObject:@"Three"];
        [items addObject:@"Four"];
        [items insertObject:@"Zero" atIndex:0];
        
        // Simply iterate on the array and print the data in it
        for(int i = 0; i < [items count]; i++) {
            NSString *current = [items objectAtIndex:i];
            NSLog(@"Current is: %@", current);
        }
        
        NSLog(@"------------- Optimize baby ---------------");
        
        // Optimization: for-each loop
        for(NSString *current in items) {
            NSLog(@"Current is %@", current);
        }
        
        
        
        NSLog(@"--------------- ITEM WITH ALL VALUES------------------------");
        Item *item = [[Item alloc] initWithName:@"Red Sofa" valueInDollars:100 serialNumber:@"12RFG"];
        NSLog(@"%@", item);
        
        
        NSLog(@"--------------- ITEM WITH NAME------------------------");
        Item *itemWithName = [[Item alloc] initWithName:@"Blue sofa"];
        NSLog(@"%@", itemWithName);
        
        
        NSLog(@"--------------- ITEM EMPTY------------------------");
        Item *emptyItem = [[Item alloc] init];
        NSLog(@"%@", emptyItem);
        
        
        
        NSLog(@"--------------- CREATE A RANDOM LIST ------------------------");
        items = [[NSMutableArray alloc] init];
        
        for(int i = 0; i < 10; i++) {
            Item *item = [Item randomItem];
            [items addObject:item];
        }
        
        
        for(Item *item in items) {
            NSLog(@"%@", item);
        }
        
        

        items = nil;
        
    }
    return 0;
}
