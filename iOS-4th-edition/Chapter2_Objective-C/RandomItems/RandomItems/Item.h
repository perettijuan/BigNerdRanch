//
//  Item.h
//  RandomItems
//
//  Created by Juan Pablo Peretti on 28/1/16.
//  Copyright (c) 2016 Juan Pablo Peretti. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Item : NSObject
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
