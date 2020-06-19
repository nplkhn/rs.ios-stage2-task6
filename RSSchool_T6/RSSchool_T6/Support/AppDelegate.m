//
//  AppDelegate.m
//  RSSchool_T6
//
//  Created by Никита Плахин on 6/18/20.
//  Copyright © 2020 Никита Плахин. All rights reserved.
//

#import "AppDelegate.h"
#import "Screen1ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:UIScreen.mainScreen.bounds];
    Screen1ViewController *viewController = [Screen1ViewController new];
    
    [self.window setRootViewController:viewController];
    
    [self.window makeKeyAndVisible];
    
    return YES;
}


@end
