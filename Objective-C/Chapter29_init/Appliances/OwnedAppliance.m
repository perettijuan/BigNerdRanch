//
//  OwnedAppliance.m
//  Appliances
//
//  Created by Juan Pablo Peretti on 25/1/16.
//  Copyright (c) 2016 Juan Pablo Peretti. All rights reserved.
//

#import "OwnedAppliance.h"

@implementation OwnedAppliance



/*
 * Note that a client of this interface can create a terrible bug:
 * if it creates an instance of OwnedAppliance like this:
 *           OwnedAppliance *a = [[OwnedAppliance alloc] initWithProductName:@"Toaster"]
 * the MutableSet of owners will never be allocated. That's why we override the method
 * initWithProductName:(NSString *)pn from Appliance class.
 */
-(id) initWithProductName:(NSString *)pn firstNameOwner:(NSString *)n
{
    self = [super initWithProductName:pn];
    
    if(self) {
        owners = [[NSMutableSet alloc] init];
        
        if(n) {
            [owners addObject:n];
        }
    }
    
    return self;
}


/*
 * Overrided from Appliance. This is to avoid non-initialization of the
 * owners NSMutableSet.
 */
-(id) initWithProductName:(NSString *)pn
{
    return [self initWithProductName:pn firstNameOwner:nil];
}



-(void) addOwnerNameObject:(NSString *)n
{
    [owners addObject:n];
}


-(void) removeOwnerNameObject:(NSString *)n
{
    [owners removeObject:n];
}

@end
