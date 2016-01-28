//
//  QuizViewController.m
//  
//
//  Created by Juan Pablo Peretti on 27/1/16.
//
//

#import "QuizViewController.h"

@interface QuizViewController ()

@property (nonatomic, weak) IBOutlet UILabel *questionLabel;
@property (nonatomic, weak) IBOutlet UILabel *answerLabel;

@property (nonatomic) int questionIndex;
@property (nonatomic, copy) NSArray *questions;
@property (nonatomic, copy) NSArray *answers;

@end

@implementation QuizViewController



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
