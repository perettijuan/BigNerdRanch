//
//  StockHolding.m
//  Challenge
//
//  Created by Juan Pablo Peretti on 20/1/16.
//  Copyright (c) 2016 Juan Pablo Peretti. All rights reserved.
//

#import "StockHolding.h"

@implementation StockHolding

    @synthesize purchaseSharePrice, currentSharePrice, numberOfShares;

    -(float) costInDollars
    {
        return purchaseSharePrice * numberOfShares;
    }

    -(float) valueInDollars
    {
        return currentSharePrice * numberOfShares;
    }

@end
