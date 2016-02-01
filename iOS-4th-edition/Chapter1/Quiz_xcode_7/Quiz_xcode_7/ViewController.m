//
//  ViewController.m
//  Quiz_xcode_7
//
//  Created by Juan Pablo Peretti on 29/1/16.
//  Copyright (c) 2016 Juan Pablo Peretti. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, weak) IBOutlet UILabel *questionLabel;
@property (nonatomic, weak) IBOutlet UILabel *answerLabel;

@property (nonatomic) int questionIndex;
@property (nonatomic, copy) NSArray *questions;
@property (nonatomic, copy) NSArray *answers;

@end

@implementation ViewController


-(void) awakeFromNib
{
    [super awakeFromNib];
    
    if(self) {
        // Create the two arrays filled with questions and answers
        self.questions = @[@"From what is cognac made?",
                           @"What is 7 + 7?",
                           @"What is the capital of Vermont?"];
        self.answers = @[@"Grapes",
                         @"14",
                         @"Montpelier"];
    }
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
