//
//  AppDelegate.m
//  Homepwner
//
//  Created by Juan Pablo Peretti on 5/2/16.
//  Copyright (c) 2016 Juan Pablo Peretti. All rights reserved.
//

#import "AppDelegate.h"
#import "BNRItemsViewController.h"
#import "BNRItemStore.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    BNRItemsViewController *itemsViewController = [[BNRItemsViewController alloc] init];
    
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:itemsViewController];
    
    self.window.rootViewController = navController;
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}


// Callback called when the app is "closed"
-(void)applicationDidEnterBackground:(UIApplication *)application
{
    BOOL success = [[BNRItemStore sharedStore] saveChanges];
    if(success) {
        NSLog(@"Saved all of the Items");
    } else {
        NSLog(@"Could not save any of the Items");
    }
}

@end
