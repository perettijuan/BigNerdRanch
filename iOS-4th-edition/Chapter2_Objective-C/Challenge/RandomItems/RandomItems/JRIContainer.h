//
//  Container.h
//  RandomItems
//
//  Created by Juan Pablo Peretti on 29/1/16.
//  Copyright (c) 2016 Juan Pablo Peretti. All rights reserved.
//

#import "JRIItem.h"

@interface JRIContainer : JRIItem
{
    NSMutableArray *_subItems;
}

// Adds a new Sub item to the list of subitems
-(void)addNewSubItem:(JRIItem *) newItem;
// Retrieves a Sub Item at a given position
-(JRIItem *)getSubItemAtPossition:(int)position;
// Retrieves the entire list of sub Items
-(NSMutableArray *)getSubItems;

@end
