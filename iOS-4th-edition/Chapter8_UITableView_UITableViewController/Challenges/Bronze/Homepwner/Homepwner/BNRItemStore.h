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

@end
