//
//  BNRHypnosisViewController.m
//  HypnoNerd
//
//  Created by Juan Pablo Peretti on 1/2/16.
//  Copyright (c) 2016 Juan Pablo Peretti. All rights reserved.
//

#import "BNRHypnosisViewController.h"
#import "BNRHypnosisView.h"

@implementation BNRHypnosisViewController



-(instancetype) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if(self) {
        // Set the tab bar's item title
        self.tabBarItem.title = @"Hypnotize";
        // Create an image from a file
        // This will use Hypno@2x in retina display devices.
        UIImage *i = [UIImage imageNamed:@"Hypno.png"];
        // put that image in the tab bar item
        self.tabBarItem.image = i;
    }
    
    return self;
}

/**
 * Method called when the framework asks to the ViewController to load the
 * view to show.
 */
-(void)loadView
{
    // Create a view
    BNRHypnosisView *backgroundView = [[BNRHypnosisView alloc] init];
    // This attribute (view) is inherited from ViewController and is the view root of the controller
    self.view = backgroundView;
}

@end
