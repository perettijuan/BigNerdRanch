//
//  BNRQuizViewController.m
//  HypnoNerd
//
//  Created by Juan Pablo Peretti on 1/2/16.
//  Copyright (c) 2016 Juan Pablo Peretti. All rights reserved.
//

#import "BNRQuizViewController.h"

@interface BNRQuizViewController ()

@property (nonatomic, weak) IBOutlet UILabel *questionLabel;
@property (nonatomic, weak) IBOutlet UILabel *answerLabel;

@property (nonatomic) int questionIndex;
@property (nonatomic, copy) NSArray *questions;
@property (nonatomic, copy) NSArray *answers;

@end

@implementation BNRQuizViewController


/*
 * This metod is the one that is called at the start up of the application, just before the view
 * is visible. So, all initialization, can be made here.
 */
- (instancetype) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    // Call super initializer to create the instance
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if(self) {
        // Create the two arrays filled with questions and answers
        self.questions = @[@"From what is cognac made?",
                           @"What is 7 + 7?",
                           @"What is the capital of Vermont?"];
        self.answers = @[@"Grapes",
                         @"14",
                         @"Montpelier"];
        
        // Prepare it to show in the tab
        // Set the tab bar's item title
        self.tabBarItem.title = @"Quiz";
        // Create an image from a file
        // This will use Hypno@2x in retina display devices.
        UIImage *i = [UIImage imageNamed:@"Icon.png"];
        // put that image in the tab bar item
        self.tabBarItem.image = i;
        
    }
    return self;
}


- (IBAction)showQuestion:(id)sender
{
    self.questionIndex++;
    
    // Am I past the last question?
    if (self.questionIndex == [self.questions count]) {
        self.questionIndex = 0;
    }
    
    NSString *question = self.questions[self.questionIndex];
    
    self.questionLabel.text = question;
    self.answerLabel.text = @"???";
    
}

- (IBAction)showAnswer:(id)sender
{
    NSString *answer = self.answers[self.questionIndex];
    self.answerLabel.text = answer;
}


@end
