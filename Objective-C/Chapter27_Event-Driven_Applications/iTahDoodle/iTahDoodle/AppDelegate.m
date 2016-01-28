//
//  AppDelegate.m
//  iTahDoodle
//
//  Created by Juan Pablo Peretti on 22/1/16.
//  Copyright (c) 2016 Juan Pablo Peretti. All rights reserved.
//

#import "AppDelegate.h"

NSString *docPath() {
    NSArray *pathList = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    return [[pathList objectAtIndex:0] stringByAppendingPathComponent:@"data.td"];
}

@interface AppDelegate ()

@end

@implementation AppDelegate


#pragma mark - Application Delegate callbacks

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOption
{
    // Attempt to load an array of tasks stored in the disk
    NSArray *plist = [NSArray arrayWithContentsOfFile:docPath()];
    if(plist) {
        // If exists, then copy it to the array that we have
        tasks = [plist mutableCopy];
    } else {
        // if doesn't exists, create the instance
        tasks = [[NSMutableArray alloc] init];
    }
    
    // Is tasks empty?
    if ([tasks count] == 0) {
        // Put some strings in it
        [tasks addObject:@"Walk the dogs"];
        [tasks addObject:@"Feed the hogs"];
        [tasks addObject:@"Chop the logs"];
    }
    
    //Create and configure the UIWindow instance
    // A CGRect is a structure with an origin in (x,y) and size (width, height)
    CGRect windowFrame = [[UIScreen mainScreen] bounds];
    UIWindow *theWindow = [[UIWindow alloc] initWithFrame:windowFrame];
    [self setWindow:theWindow];
    
    // Define the frame rectangles of the three UI elements
    // CGRectMake() creates a CGRect from (x, y, width, height)
    CGRect tableFrame = CGRectMake(0, 80, 320, 380);
    CGRect fieldFrame = CGRectMake(20, 40, 200, 31);
    CGRect buttonFrame = CGRectMake(228, 40, 72, 31);
    
    //Create and configure the table
    taskTable = [[UITableView alloc] initWithFrame:tableFrame style:UITableViewStylePlain];
    [taskTable setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    // Make this object the table's data source
    [taskTable setDataSource:self];
    
    //Create and configure the text field where the tasks are going to be typed
    taskField = [[UITextField alloc] initWithFrame:fieldFrame];
    [taskField setBorderStyle:UITextBorderStyleRoundedRect];
    [taskField setPlaceholder:@"Type the task and tap Insert!"];
    
    // Create and configure the Insert button
    insertButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [insertButton setFrame:buttonFrame];
    
    // Set the "button listener" - a target action
    // Configure it to call the addAction method of this class
    [insertButton addTarget:self action:@selector(addTask:) forControlEvents:UIControlEventTouchUpInside];
    
    // Give the button a title
    [insertButton setTitle:@"Insert" forState:UIControlStateNormal];
    
    // Add the three elements to the window
    [[self window] addSubview:taskTable];
    [[self window] addSubview:taskField];
    [[self window] addSubview:insertButton];
    
    // Finalize the window and put it on screen
    [[self window] setBackgroundColor:[UIColor whiteColor]];
    [[self window] makeKeyAndVisible];
    
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // This method is only called in iOS 4.0+
    // Save our tasks array to disk
    [tasks writeToFile:docPath() atomically:YES];
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // This method is only called in iOS versions prior to 4.0
    // Save our tasks array to disk
    [tasks writeToFile:docPath() atomically:YES];
}


#pragma mark - Table View Management

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    //since this table has only one section
    //the number of row is identical to the number of items
    return [tasks count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // To improve performance, we reconfigure cells in memory
    // that have scrolled off the screen and hand them back
    // with new contents instead of always creating new cells.
    // First, we check to see if there's a cell available for reuse.
    UITableViewCell *c = [taskTable dequeueReusableCellWithIdentifier:@"Cell"];
    
    if(!c) {
        //Allocate a new cell only if no one is available
        c = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    
    // Now we (re) configure the cell with the data in our list items
    NSString *task = [tasks objectAtIndex:[indexPath row]];
    [[c textLabel] setText:task];
    
    return c;
}


-(void)addTask:(id)sender
{
    // Get the to-do item
    NSString *t = [taskField text];
    
    //Quit here if text is empty
    if([t isEqual:@""]) {
        return;
    }
    
    // Add it to our working array
    [tasks addObject:t];
    
    //Refresh the table so the new data is shown
    [taskTable reloadData];
    
    //And clear out the textfield
    [taskField setText:@""];
    
    //Dismiss the keyboard
    [taskField resignFirstResponder];
}

@end
