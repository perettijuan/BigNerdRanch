//
//  AppDelegate.m
//  TouchTracker
//
//  Created by Juan Pablo Peretti on 1/3/16.
//  Copyright (c) 2016 Juan Pablo Peretti. All rights reserved.
//

#import "AppDelegate.h"
#import "BNRDrawViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window =[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    BNRDrawViewController *dvc = [[BNRDrawViewController alloc] init];
    self.window.rootViewController = dvc;
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}


@end
