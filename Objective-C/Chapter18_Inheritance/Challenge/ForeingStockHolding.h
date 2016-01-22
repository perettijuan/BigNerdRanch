//
//  ForeingStockHolding.h
//  Challenge
//
//  Created by Juan Pablo Peretti on 20/1/16.
//  Copyright (c) 2016 Juan Pablo Peretti. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StockHolding.h"

@interface ForeingStockHolding : StockHolding

{
    float conversionRate;
}

@property float convertionRate;

@end
