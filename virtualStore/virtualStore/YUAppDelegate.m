//
//  YUAppDelegate.m
//  virtualStore
//
//  Created by ioschen on 9/12/13.
//  Copyright (c) 2013 ioschen. All rights reserved.
//

#import "YUAppDelegate.h"
#import "UserGuideViewController.h"
#import "YUTabBarController.h"
@implementation YUAppDelegate
@synthesize myapparray;
@synthesize myappDictionary;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
    
    //增加标识，用于判断是否是第一次启动应用...
    if (![[NSUserDefaults standardUserDefaults] boolForKey:@"everLaunched"]) {
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"everLaunched"];
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"firstLaunch"];
    }
    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"firstLaunch"])
    {
        NSLog(@"不是第一次启动");
        YUTabBarController *yu = [[YUTabBarController alloc] init];
        self.window.rootViewController=yu;
//        NSLog(@"第一次启动");
//        //如果是第一次启动的话,使用UserGuideViewController (用户引导页面) 作为根视图
//        UserGuideViewController *userGuideViewController = [[UserGuideViewController alloc] init];
//        self.window.rootViewController = userGuideViewController;
    }
    else
    {
        NSLog(@"第一次启动");
        //如果是第一次启动的话,使用UserGuideViewController (用户引导页面) 作为根视图
        UserGuideViewController *userGuideViewController = [[UserGuideViewController alloc] init];
        self.window.rootViewController = userGuideViewController;
//        NSLog(@"不是第一次启动");
//        YUTabBarController *yu = [[YUTabBarController alloc] init];
//        self.window.rootViewController=yu;
    }
    
    
    //用来传值到菜单栏的
    //myapparray=[[NSMutableArray alloc]init];
    myappDictionary=[[NSMutableDictionary alloc]init];
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
