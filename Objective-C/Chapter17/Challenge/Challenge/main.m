//
//  main.m
//  Challenge
//
//  Created by Juan Pablo Peretti on 20/1/16.
//  Copyright (c) 2016 Juan Pablo Peretti. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StockHolding.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        StockHolding *holding1 = [[StockHolding alloc] init];
        [holding1 setPurchaseSharePrice:12.0];
        [holding1 setCurrentSharePrice:16.0];
        [holding1 setNumberOfShares:3000];
        
        StockHolding *holding2 = [[StockHolding alloc] init];
        [holding2 setPurchaseSharePrice:76.0];
        [holding2 setCurrentSharePrice:91.0];
        [holding2 setNumberOfShares:18000];
        
        StockHolding *holding3 = [[StockHolding alloc] init];
        [holding3 setPurchaseSharePrice:120.0];
        [holding3 setCurrentSharePrice:117.0];
        [holding3 setNumberOfShares:7000];
        
        NSArray *stocks = [NSArray arrayWithObjects:holding1, holding2, holding3, nil];
        
        for(StockHolding *holding in stocks) {
            float cost = [holding costInDollars];
            float value = [holding valueInDollars];
            NSLog(@"The cost is %f and the value is %f", cost, value);
        }
        
    }
    return 0;
}
