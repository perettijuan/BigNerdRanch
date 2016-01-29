//
//  Item.m
//  RandomItems
//
//  Created by Juan Pablo Peretti on 28/1/16.
//  Copyright (c) 2016 Juan Pablo Peretti. All rights reserved.
//

#import "JRIItem.h"

@implementation JRIItem


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

    JRIItem *newItem = [[self alloc] initWithName:randomName valueInDollars:randromValue serialNumber:randomSerialNumber];
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
    }
    
    return self;
}


-(instancetype) initWithName:(NSString *)name
{
    return [self initWithName:name valueInDollars:0 serialNumber:@""];
}


-(instancetype) init
{
    return [self initWithName:@"Item"];
}

// Silver challenge: “Create another initializer method for the BNRItem class. This initializer is not the designated initializer of BNRItem. It takes an instance of NSString that identifies the itemName of the item and an instance of NSString that identifies the serialNumber.”
-(instancetype) initwithName:(NSString *)name serialNumber:(NSString *)serialNumber
{
    return [self initWithName:name valueInDollars:0 serialNumber:serialNumber];
}


-(void) setItemName:(NSString *)itemName
{
    _itemName = itemName;
}

-(NSString *) itemName
{
    return _itemName;
}

-(void) setSerialNumber:(NSString *)serialNumber
{
    _serialNumber = serialNumber;
}

-(NSString *) serialNumber
{
    return _serialNumber;
}

-(void) setValueInDollars:(int)valueInDollars
{
    _valueInDollars = valueInDollars;
}

-(int) valueInDollars
{
    return _valueInDollars;
}


-(void) setDateCreated:(NSDate *)dateCreated
{
    _dateCreated = dateCreated;
}

-(NSDate *) dateCreated
{
    return _dateCreated;
}

/////////// en setters and getters //////////////


// Override description
-(NSString *) description
{
    NSString *descriptionString = [[NSString alloc] initWithFormat:@"%@ (%@): Worth %d, recorded on %@", self.itemName,
        self.serialNumber,
        self.valueInDollars,
        self.dateCreated];
    return descriptionString;
}

@end
