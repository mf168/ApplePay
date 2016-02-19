//
//  AppDelegate.m
//  ApplePay
//
//  Created by apple on 16/2/19.
//  Copyright © 2016年 wff. All rights reserved.
//

#import "AppDelegate.h"
#import "PayViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    PayViewController *payVc = [PayViewController new];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:payVc];
    self.window.rootViewController = nav;
    return YES;
}

@end
