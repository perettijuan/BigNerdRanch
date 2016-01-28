//
//  AppDelegate.h
//  iTahDoodle
//
//  Created by Juan Pablo Peretti on 22/1/16.
//  Copyright (c) 2016 Juan Pablo Peretti. All rights reserved.
//

#import <UIKit/UIKit.h>

// Declare a helper function that will allow us
// to retrieve the path to where the file with the tasks is located
NSString *docPath(void);

@interface AppDelegate : UIResponder <UIApplicationDelegate, UITableViewDataSource>
{
    UITableView *taskTable;
    UITextField *taskField;
    UIButton *insertButton;
    
    NSMutableArray *tasks;
}
@property (strong, nonatomic) UIWindow *window;


-(void) addTask:(id)sender;

@end

