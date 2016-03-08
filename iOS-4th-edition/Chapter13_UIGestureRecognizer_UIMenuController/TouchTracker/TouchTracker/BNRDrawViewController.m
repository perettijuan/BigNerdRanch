//
//  BNRDrawViewController.m
//  TouchTracker
//
//  Created by Juan Pablo Peretti on 1/3/16.
//  Copyright (c) 2016 Juan Pablo Peretti. All rights reserved.
//

#import "BNRDrawViewController.h"
#import "BNRDrawView.h"

@interface BNRDrawViewController ()

@end

@implementation BNRDrawViewController

-(void) loadView
{
    self.view = [[BNRDrawView alloc] initWithFrame:CGRectZero];
}

@end
