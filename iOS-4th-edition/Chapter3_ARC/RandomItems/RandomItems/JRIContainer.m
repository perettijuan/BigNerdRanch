//
//  Container.m
//  RandomItems
//
//  Created by Juan Pablo Peretti on 29/1/16.
//  Copyright (c) 2016 Juan Pablo Peretti. All rights reserved.
//

#import "BNRContainer.h"

@implementation BNRContainer


// Designated initializer
-(instancetype) initWithName:(NSString *)name valueInDollars:(int)value serialNumber:(NSString *)serialNumber
{
    self = [super initWithName:name valueInDollars:value serialNumber:serialNumber];
    if(self) {
        _subItems = [[NSMutableArray alloc] init];
    }
    
    return self;
}


-(instancetype) initwithName:(NSString *)name serialNumber:(NSString *)serialNumber
{
    return [self initWithName:name valueInDollars:0 serialNumber:serialNumber];
}


-(instancetype) initWithName:(NSString *)name
{
    return [self initwithName:name serialNumber:@""];
}


-(instancetype) init
{
    return [self initWithName:@"Item"];
}

//////////// Class methods ///////////////////////////////
-(void) addNewSubItem:(BNRItem *)newItem
{
    [_subItems addObject:newItem];
    self.valueInDollars += newItem.valueInDollars;
}

-(BNRItem *) getSubItemAtPossition:(int)position
{
    if(position < _subItems.count) {
        return _subItems[position];
    } else {
        return nil;
    }
}


-(NSMutableArray *) getSubItems
{
    return _subItems;
}



-(NSString *) description
{
    NSString *description = [[NSString alloc] initWithFormat:@"%@: Worth %d and contains %@",
                             [self itemName],
                             [self valueInDollars],
                             [self getSubItems]];
    return description;
}

@end
