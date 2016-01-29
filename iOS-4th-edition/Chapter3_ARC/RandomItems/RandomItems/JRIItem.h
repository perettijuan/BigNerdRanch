//
//  Item.h
//  RandomItems
//
//  Created by Juan Pablo Peretti on 28/1/16.
//  Copyright (c) 2016 Juan Pablo Peretti. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JRIItem : NSObject
{
    NSString *_itemName;
    NSString *_serialNumber;
    int _valueInDollars;
    NSDate *_dateCreated;
}

// This is a class method (like a static method in Java)
+(instancetype)randomItem;

// Designated initializer
-(instancetype)initWithName:(NSString *)name valueInDollars:(int)value serialNumber:(NSString *) serialNumber;
-(instancetype) initWithName:(NSString *)name;

// Silver challenge: “Create another initializer method for the BNRItem class. This initializer is not the designated initializer of BNRItem. It takes an instance of NSString that identifies the itemName of the item and an instance of NSString that identifies the serialNumber.”
-(instancetype) initwithName:(NSString *) name serialNumber:(NSString *) serialNumber;


// Setters and getters
-(void) setItemName:(NSString *) itemName;
-(NSString *) itemName;

-(void) setSerialNumber:(NSString *) serialNumber;
-(NSString *) serialNumber;

-(void) setValueInDollars:(int) valueInDollars;
-(int) valueInDollars;

-(void) setDateCreated:(NSDate *) dateCreated;
-(NSDate *) dateCreated;



@end
