//
//  Item.m
//  RandomItems
//
//  Created by Juan Pablo Peretti on 28/1/16.
//  Copyright (c) 2016 Juan Pablo Peretti. All rights reserved.
//

#import "BNRItem.h"

@implementation BNRItem


+(instancetype) randomItem
{
    NSArray *randomAdjectiveList = @[@"Flufy", @"Rusty", @"Shiny"];
    NSArray *randomNounList = @[@"Bear", @"Spork", @"Mac"];
    
    // Get the index of a random adjective/noun from the lists
    // Note: the % operator (called modulo) gives you the remainder
    NSInteger adjectiveIndex = arc4random() % [randomAdjectiveList count];
    NSInteger nounIndex = arc4random() % [randomNounList count];
    
    NSString *randomName = [NSString stringWithFormat:@"%@ %@",
                            randomAdjectiveList[adjectiveIndex],
                            randomNounList[nounIndex]];
    int randromValue = arc4random() % 100;
    
    NSString *randomSerialNumber = [NSString stringWithFormat:@"%c%c%c%c%c",
                                    'O' + arc4random() % 10,
                                    'A' + arc4random() % 26,
                                    'O' + arc4random() % 10,
                                    'A' + arc4random() % 26,
                                    'O' + arc4random() % 10];

    BNRItem *newItem = [[self alloc] initWithName:randomName valueInDollars:randromValue serialNumber:randomSerialNumber];
    return newItem;
}


// INITIALIZERS
-(instancetype) initWithName:(NSString *)name valueInDollars:(int)value serialNumber:(NSString *)serialNumber
{
    self = [super init];
    
    if(self) {
        _itemName = name;
        _valueInDollars = value;
        _serialNumber = serialNumber;
        _dateCreated = [[NSDate alloc] init];
        
        // Create a NSUUID object
        NSUUID *uuid = [[NSUUID alloc] init];
        NSString *key = [uuid UUIDString];
        _itemKey = key;
    }
    
    return self;
}

-(instancetype) initwithName:(NSString *)name serialNumber:(NSString *)serialNumber
{
    return [self initWithName:name valueInDollars:0 serialNumber:serialNumber];
}

-(instancetype) initWithName:(NSString *)name
{
    return [self initWithName:name valueInDollars:0 serialNumber:@""];
}

-(instancetype) init
{
    return [self initWithName:@"Item"];
}


-(void) dealloc
{
    NSLog(@"Destroyed: %@", self);
}

// Override description
-(NSString *) description
{
    NSString *descriptionString = [[NSString alloc] initWithFormat:@"%@ (%@): Worth %d, recorded on %@", self.itemName,
        self.serialNumber,
        self.valueInDollars,
        self.dateCreated];
    return descriptionString;
}


// -- method defined by <NSCoding> to store/retrieve objects

-(void) encodeWithCoder:(NSCoder *)aCoder
{
    // write the values of the object to the file system via the NSCoder
    // stored as key-value pairs
    [aCoder encodeObject:self.itemName forKey:@"itemName"];
    [aCoder encodeObject:self.serialNumber forKey:@"serialNumber"];
    [aCoder encodeObject:self.dateCreated forKey:@"dateCreated"];
    [aCoder encodeObject:self.itemKey forKey:@"itemKey"];
    [aCoder encodeInt:self.valueInDollars forKey:@"valueInDollars"];
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if(self) {
        _itemName = [aDecoder decodeObjectForKey:@"itemName"];
        _serialNumber = [aDecoder decodeObjectForKey:@"serialNumber"];
        _dateCreated = [aDecoder decodeObjectForKey:@"dateCreated"];
        _itemKey = [aDecoder decodeObjectForKey:@"itemKey"];
        _valueInDollars = [aDecoder decodeIntForKey:@"valueInDollars"];
    }
    return self;
}

@end
