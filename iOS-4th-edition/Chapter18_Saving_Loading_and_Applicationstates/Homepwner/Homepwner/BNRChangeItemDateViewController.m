//
//  BNRChangeItemDateViewController.m
//  Homepwner
//
//  Created by Juan Pablo Peretti on 23/2/16.
//  Copyright (c) 2016 Juan Pablo Peretti. All rights reserved.
//

#import "BNRChangeItemDateViewController.h"
#import "BNRItem.h"

@interface BNRChangeItemDateViewController ()
@property (nonatomic, weak) IBOutlet UIDatePicker *itemDatePicker;
@end

@implementation BNRChangeItemDateViewController

/**
 * This method will be called every time that the view
 * is going to be shown.
 */
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    // set the datepicker to show a brief period of time since now
    self.itemDatePicker.minimumDate= [NSDate dateWithTimeIntervalSinceNow:60];
    
    
    BNRItem *item = self.item;
    [self.itemDatePicker setDate:item.dateCreated];
}

/*
 * Method called (this time by the UINavigationController) called when this ViewController
 * is about to be popped from the stack
 */
-(void) viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    // clear first the responder
    /*
     “Notice the use of endEditing:. When the message endEditing: is sent to a view, if it or any of its subviews is currently the first responder,
     it will resign its first responder status, and the keyboard will be dismissed. (The argument passed determines whether the first responder
     should be forced into retirement. Some first responders might refuse to resign, and passing YES ignores that refusal.)”
     
     Fragmento de: Conway, Joe. “iOS Programming: The Big Nerd Ranch Guide (4th Edition) (Big Nerd Ranch Guides)”. iBooks.
     */
    [self.view endEditing:YES];
    
    // Save changes to the item
    BNRItem *item = self.item;
    item.dateCreated = self.itemDatePicker.date;
}

@end
