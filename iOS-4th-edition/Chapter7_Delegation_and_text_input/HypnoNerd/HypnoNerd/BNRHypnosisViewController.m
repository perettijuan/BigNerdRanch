//
//  BNRHypnosisViewController.m
//  HypnoNerd
//
//  Created by Juan Pablo Peretti on 1/2/16.
//  Copyright (c) 2016 Juan Pablo Peretti. All rights reserved.
//

#import "BNRHypnosisViewController.h"
#import "BNRHypnosisView.h"


// Declare that the BNRHypnosisViewController conforms (implements) the protocol (interface) UITextFieldDelegate

@interface BNRHypnosisViewController () <UITextFieldDelegate>

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
    BNRHypnosisView *backgroundView = [[BNRHypnosisView alloc] init];
    
    CGRect textFieldRect = CGRectMake(40, 70, 240, 30);
    UITextField *textField = [[UITextField alloc] initWithFrame:textFieldRect];
    textField.borderStyle = UITextBorderStyleRoundedRect;
    // This is the hint
    textField.placeholder = @"Hypnotize me";
    // The keyboard's enter button will be change by the Done button
    textField.returnKeyType = UIReturnKeyDone;
    
    // Use of the delegate pattern to receive messages from the text field
    textField.delegate = self;
    
    [backgroundView addSubview:textField];
    
    // This attribute (view) is inherited from ViewController and is the view root of the controller
    self.view = backgroundView;
}


-(void)drawHypnoticMessage:(NSString *) message
{
    for(int i = 0; i <20; i++) {
        UILabel *messageLabel = [[UILabel alloc] init];
        // Configure label's color and text
        messageLabel.backgroundColor = [UIColor whiteColor];
        messageLabel.text = message;
        // This methods resizes the label which will be relative to the text that it is displaying
        [messageLabel sizeToFit];
        
        // get a random x value that fits the hypnosis view's width
        int width = (int) (self.view.bounds.size.width - messageLabel.bounds.size.width);
        int x = arc4random() % width;
        
        // get a random x value that fits the hypnosis view's height
        int height = (int) (self.view.bounds.size.height - messageLabel.bounds.size.height);
        int y = arc4random() % height;
        
        // Update the label's frame
        CGRect frame = messageLabel.frame;
        frame.origin = CGPointMake(x, y);
        messageLabel.frame = frame;
        
        // add the label to the hierarchy
        [self.view addSubview:messageLabel];
        
        // Now, give a notion of parallax to the text view
        UIInterpolatingMotionEffect *motionEffect;
        
        // This will give the effect on the x axis
        motionEffect = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.x" type:UIInterpolatingMotionEffectTypeTiltAlongHorizontalAxis];
        motionEffect.minimumRelativeValue = @(-25);
        motionEffect.maximumRelativeValue = @(-25);
        [messageLabel addMotionEffect:motionEffect];
        
        // This will give the effect on the y axis
        motionEffect = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.y" type:UIInterpolatingMotionEffectTypeTiltAlongVerticalAxis];
        motionEffect.minimumRelativeValue = @(-25);
        motionEffect.maximumRelativeValue = @(-25);
        [messageLabel addMotionEffect:motionEffect];
    }
}

// Method implementation from the protocol defined by UITextfieldDelegate
-(BOOL) textFieldShouldReturn:(UITextField *) textField
{
    [self drawHypnoticMessage:textField.text];
    textField.text = @"";
    // the textfield doesnt wants to be the first responder anymore
    [textField resignFirstResponder];
    return YES;
}

@end
