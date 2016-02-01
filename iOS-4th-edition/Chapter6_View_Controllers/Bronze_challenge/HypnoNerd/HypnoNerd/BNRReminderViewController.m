//
//  BNRReminderViewController.m
//  HypnoNerd
//
//  Created by Juan Pablo Peretti on 1/2/16.
//  Copyright (c) 2016 Juan Pablo Peretti. All rights reserved.
//

#import "BNRReminderViewController.h"

@interface BNRReminderViewController()
// Property of type IBOutlet to control the date picker component
@property (nonatomic, weak) IBOutlet UIDatePicker *datePicker;
@end

@implementation BNRReminderViewController


-(instancetype) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if(self) {
        // Give a label to the tab bar
        self.tabBarItem.title = @"Reminder";
        
        // Create an image from a file
        // This will use Hypno@2x in retina display devices.
        UIImage *i = [UIImage imageNamed:@"Time.png"];
        
        // Give the image to the tab bar
        self.tabBarItem.image = i;
    }
    return self;
}


/**
 * This method will be called every time that the view
 * is going to be shown.
 */
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    // set the datepicker to show a brief period of time since now
    self.datePicker.minimumDate= [NSDate dateWithTimeIntervalSinceNow:60];
}

/**
 * This IBAction is the one that is attached to the button
 * that adds a new reminder.
 */
-(IBAction)addReminder:(id)sender
{
    NSDate *date = self.datePicker.date;
    NSLog(@"Setting a reminder for %@", date);
    
    UILocalNotification *localNotification = [[UILocalNotification alloc] init];
    localNotification.alertBody = @"Hypnotize me!";
    localNotification.fireDate = date;
    
    [[UIApplication sharedApplication]scheduleLocalNotification:localNotification];
}
@end
