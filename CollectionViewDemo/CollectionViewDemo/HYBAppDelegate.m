//
//  HYBAppDelegate.m
//  CollectionViewDemo
//
//  Created by ljy-335 on 14-9-29.
//  Copyright (c) 2014年 uni2uni. All rights reserved.
//

#import "HYBAppDelegate.h"
#import "HYBRootController.h"

@implementation HYBAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    //
    HYBRootController *rootController = [[HYBRootController alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:rootController];
    self.window.rootViewController = nav;
    //
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

@end
