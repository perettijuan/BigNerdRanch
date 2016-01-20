//
//  main.m
//  Challenge
//
//  Created by Juan Pablo Peretti on 20/1/16.
//  Copyright (c) 2016 Juan Pablo Peretti. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ForeingStockHolding.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
         ForeingStockHolding *holding1 = [[ForeingStockHolding alloc] init];
        [holding1 setPurchaseSharePrice:12.0];
        [holding1 setCurrentSharePrice:16.0];
        [holding1 setNumberOfShares:3000];
        [holding1 setConvertionRate:12.3];
        
        ForeingStockHolding *holding2 = [[ForeingStockHolding alloc] init];
        [holding2 setPurchaseSharePrice:76.0];
        [holding2 setCurrentSharePrice:91.0];
        [holding2 setNumberOfShares:18000];
        [holding2 setConvertionRate:12.3];
        
        ForeingStockHolding *holding3 = [[ForeingStockHolding alloc] init];
        [holding3 setPurchaseSharePrice:120.0];
        [holding3 setCurrentSharePrice:117.0];
        [holding3 setNumberOfShares:7000];
        [holding3 setConvertionRate:12.3];
        
        NSArray *stocks = [NSArray arrayWithObjects:holding1, holding2, holding3, nil];
        
        for(ForeingStockHolding *holding in stocks) {
            float cost = [holding costInDollars];
            float value = [holding valueInDollars];
            NSLog(@"The cost is %f and the value is %f", cost, value);
        }
        
    }
    return 0;
}
