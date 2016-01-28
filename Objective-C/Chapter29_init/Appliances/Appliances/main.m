//
//  main.m
//  Appliances
//
//  Created by Juan Pablo Peretti on 25/1/16.
//  Copyright (c) 2016 Juan Pablo Peretti. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Appliance.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {

        Appliance *a = [[Appliance alloc] init];
        NSLog(@"a: %@", a);
        [a setProductName:@"Washing machine"];
        [a setVoltage:190];
        NSLog(@"a: %@", a);        
    }
    return 0;
}
