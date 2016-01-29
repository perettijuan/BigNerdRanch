//
//  Container.h
//  RandomItems
//
//  Created by Juan Pablo Peretti on 29/1/16.
//  Copyright (c) 2016 Juan Pablo Peretti. All rights reserved.
//

#import "BNRItem.h"

@interface BNRContainer : BNRItem
{
    NSMutableArray *_subItems;
}

// Adds a new Sub item to the list of subitems
-(void)addNewSubItem:(BNRItem *) newItem;
// Retrieves a Sub Item at a given position
-(BNRItem *)getSubItemAtPossition:(int)position;
// Retrieves the entire list of sub Items
-(NSMutableArray *)getSubItems;

@end
