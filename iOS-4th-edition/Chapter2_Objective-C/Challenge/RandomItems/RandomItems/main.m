//
//  main.m
//  RandomItems
//
//  Created by Juan Pablo Peretti on 28/1/16.
//  Copyright (c) 2016 Juan Pablo Peretti. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JRIItem.h"
#import "JRIContainer.h"

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
        
        
        JRIItem *item = [[JRIItem alloc] initWithName:@"Red Sofa" valueInDollars:100 serialNumber:@"12RFG"];
        JRIItem *itemWithName = [[JRIItem alloc] initWithName:@"Blue sofa"];
        JRIItem *emptyItem = [[JRIItem alloc] init];
        items = [[NSMutableArray alloc] init];
        
        
        JRIContainer *container = [[JRIContainer alloc] initWithName:@"Item Container" valueInDollars:0 serialNumber:@""];
        [container addNewSubItem:item];
        [container addNewSubItem:itemWithName];
        [container addNewSubItem:emptyItem];
        
        for(JRIItem *item in items) {
            [container addNewSubItem:item];
        }
        
        
        JRIContainer *superContainer = [[JRIContainer alloc] initWithName:@"Super container" valueInDollars:0 serialNumber:@""];
        [superContainer addNewSubItem:container];
        
        
        NSLog(@"Super Container => %@", superContainer);
        

        items = nil;
        
    }
    return 0;
}
