//
//  ForeingStockHolding.m
//  Challenge
//
//  Created by Juan Pablo Peretti on 20/1/16.
//  Copyright (c) 2016 Juan Pablo Peretti. All rights reserved.
//

#import "ForeingStockHolding.h"

@implementation ForeingStockHolding

@synthesize convertionRate;

-(float) costInDollars
{
    return purchaseSharePrice * conversionRate * numberOfShares;
}

-(float) valueInDollars
{
    return currentSharePrice * conversionRate * numberOfShares;
}

@end
