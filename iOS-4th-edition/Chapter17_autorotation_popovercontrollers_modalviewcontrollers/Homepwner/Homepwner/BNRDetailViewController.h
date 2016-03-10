//
//  BNRDetailViewController.h
//  Homepwner
//
//  Created by Juan Pablo Peretti on 17/2/16.
//  Copyright (c) 2016 Juan Pablo Peretti. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BNRItem;

@interface BNRDetailViewController : UIViewController

@property (nonatomic, strong) BNRItem *item;

// This is saying that the viewController has a property named dismissBlock that points
// to a block
@property (nonatomic, copy) void(^dismissBlock) (void);


/**
 * This initializer will start the ViewController in modal mode
 * if it's for a new item creation
 */
-(instancetype)initForNewItem:(BOOL)isNew;

@end
