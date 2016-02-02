//
//  BNRHypnosisViewController.m
//  HypnoNerd
//
//  Created by Juan Pablo Peretti on 1/2/16.
//  Copyright (c) 2016 Juan Pablo Peretti. All rights reserved.
//

#import "BNRHypnosisViewController.h"
#import "BNRHypnosisView.h"

@interface BNRHypnosisViewController()
@property (nonatomic, strong) BNRHypnosisView *backgroundView;
@end

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
    self.backgroundView = [[BNRHypnosisView alloc] init];
    // This attribute (view) is inherited from ViewController and is the view root of the controller
    self.view = _backgroundView;
    
    UISegmentedControl *uiSegmentedControl = [[UISegmentedControl alloc] initWithItems:@[@"Red", @"Green", @"Blue"]];
    uiSegmentedControl.frame = CGRectMake(35, 350, 250, 50);
    [uiSegmentedControl  addTarget:self action:@selector(segmentControlAction:)forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:uiSegmentedControl];
}


-(void)segmentControlAction:(UISegmentedControl *)segmentControl
{
    NSInteger selectedIndex = segmentControl.selectedSegmentIndex;
    switch (selectedIndex) {
        case 0:
            [_backgroundView setCircleColor:[UIColor redColor]];
            break;
        case 1:
            [_backgroundView setCircleColor:[UIColor greenColor]];
            break;
        case 2:
            [_backgroundView setCircleColor:[UIColor blueColor]];
            break;
    }
}

@end
