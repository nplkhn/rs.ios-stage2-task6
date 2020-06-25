//
//  AppDelegate.m
//  RSSchool_T6
//
//  Created by Никита Плахин on 6/18/20.
//  Copyright © 2020 Никита Плахин. All rights reserved.
//

#import "AppDelegate.h"
#import "StartScreenViewController.h"
#import "CustomTabBarController.h"
#import "CustomNavigationViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:UIScreen.mainScreen.bounds];
    
    self.window.rootViewController = [self rootViewController];
    
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (UIViewController *)rootViewController {
    UINavigationController *firstViewController = [[UINavigationController alloc] initWithRootViewController:[StartScreenViewController new]];
    
    return firstViewController;
}


@end
