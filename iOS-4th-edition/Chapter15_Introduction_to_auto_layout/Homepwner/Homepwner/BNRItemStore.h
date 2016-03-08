//
//  BNRItemStore.h
//  Homepwner
//
//  Created by Juan Pablo Peretti on 10/2/16.
//  Copyright (c) 2016 Juan Pablo Peretti. All rights reserved.
//

#import <Foundation/Foundation.h>

// the @class directive tells the compiler that there is a BNRItem class and that
// the compiler does not need to know the class's details on this file.
@class BNRItem;

@interface BNRItemStore : NSObject

@property (nonatomic, readonly) NSArray *allItems;


// Notice this is a class method (static) prefixed with a +. This is for the Singleton pattern implementation
+(instancetype)sharedStore;

// creates and adds a new item
-(BNRItem *) createItem;

// Removes a given Item from the store
-(void) removeItem:(BNRItem *) item;


// Translates an Item from the original index to the new position
-(void) moveItemAtIndex:(NSUInteger)fromIndex toIndex:(NSUInteger)toIndex;

@end
