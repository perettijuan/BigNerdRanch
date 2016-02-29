//
//  BNRItemStore.m
//  Homepwner
//
//  Created by Juan Pablo Peretti on 10/2/16.
//  Copyright (c) 2016 Juan Pablo Peretti. All rights reserved.
//

#import "BNRItemStore.h"
#import "BNRItem.h"
#import "BNRImageStore.h"

@interface BNRItemStore()
// declare this as mutable to be able to add items,
// but only share an inmutable version of it
@property (nonatomic) NSMutableArray *privateItems;
@end

@implementation BNRItemStore


// Singleton implementation method
+(instancetype) sharedStore
{
    // Declaring static in this way we enforce that the variable is
    // not put on the stack and will not be destroyed.
    static BNRItemStore *sharedStore = nil;
    
    // Do i really need to create the instance?
    if(!sharedStore) {
        sharedStore = [[self alloc] initPrivate];
    }
    
    return sharedStore;
}


/**
 * If a programmer calls [[BNRItemStore alloc]init],
 * an exception is thrown to indicate the proper usage.
 */
-(instancetype) init
{
    @throw [NSException exceptionWithName:@"Singleton" reason:@"Use +[BNRItemStore sharedStore]" userInfo:nil];
}


/**
 * This is the real (secret) initializer. 
 * Note that since it's not declared in the header file, 
 * the rest of the classes can't actually 'see it'
 */
-(instancetype) initPrivate
{
    self = [super init];
    if(self) {
        _privateItems = [[NSMutableArray alloc] init];
    }
    return self;
}

// Override the getter method to return the private items
-(NSArray *) allItems
{
    return _privateItems;
}

-(BNRItem *) createItem
{
    BNRItem *item = [BNRItem randomItem];
    [_privateItems addObject:item];
    return item;
}

-(void) removeItem:(BNRItem *)item
{
    NSString *key = item.itemKey;
    [[BNRImageStore sharedStore] deleteImageForKey:key];
    [self.privateItems removeObjectIdenticalTo:item];
}

-(void) moveItemAtIndex:(NSUInteger)fromIndex toIndex:(NSUInteger)toIndex
{
    if(fromIndex == toIndex) {
        return;
    }
    
    BNRItem *item = self.privateItems[fromIndex];
    [self.privateItems removeObjectAtIndex:fromIndex];
    [self.privateItems insertObject:item atIndex:toIndex];
}
@end
