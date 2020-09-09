//
//  AppDelegate.m
//  MZRouter
//
//  Created by 李风 on 2020/8/4.
//  Copyright © 2020 mengzhu.com. All rights reserved.
//

#import "AppDelegate.h"
#import "MZRootViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:UIScreen.mainScreen.bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    
    MZRootViewController *rootVC = [[MZRootViewController alloc] init];
    UINavigationController *rootNav = [[UINavigationController alloc] initWithRootViewController:rootVC];
    
    self.window.rootViewController = rootNav;
    [self.window makeKeyAndVisible];
    
    return YES;
}

@end
