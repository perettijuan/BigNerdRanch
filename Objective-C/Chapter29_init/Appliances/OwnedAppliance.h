//
//  OwnedAppliance.h
//  Appliances
//
//  Created by Juan Pablo Peretti on 25/1/16.
//  Copyright (c) 2016 Juan Pablo Peretti. All rights reserved.
//

#import "Appliance.h"

@interface OwnedAppliance : Appliance
{
    NSMutableSet *owners;
}

// The designated initializer
-(id) initWithProductName:(NSString *)pn
           firstNameOwner:(NSString *) n;

-(void) addOwnerNameObject:(NSString *) n;

-(void) removeOwnerNameObject:(NSString *)n;

@end
