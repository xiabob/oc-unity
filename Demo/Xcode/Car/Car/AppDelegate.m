//
//  AppDelegate.m
//  Car
//
//  Created by 夏名 on 2018/3/12.
//  Copyright © 2018年 xiabob. All rights reserved.
//

#import "AppDelegate.h"
#import "UnityAppController.h"
#import "UnityUtils.h"

@interface AppDelegate ()

@property (nonatomic, assign) BOOL isUnityRunning;
@property (nonatomic, strong) UIApplication *application;
@property (nonatomic, strong) UnityAppController *currentUnityController;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.application = application;
    
    self.currentUnityController = [[UnityAppController alloc] init];
    [self.currentUnityController application:application didFinishLaunchingWithOptions:launchOptions];
    
    // first call to startUnity will do some init stuff, so just call it here and directly stop it again
    [self startUnity];
//    [self stopUnity];
    
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    
    if (self.isUnityRunning) {
        [self.currentUnityController applicationWillResignActive:application];
    }
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    
    if (self.isUnityRunning) {
        [self.currentUnityController applicationDidEnterBackground:application];
    }
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    
    if (self.isUnityRunning) {
        [self.currentUnityController applicationWillEnterForeground:application];
    }
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    
    if (self.isUnityRunning) {
        [self.currentUnityController applicationDidBecomeActive:application];
    }
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    
    if (self.isUnityRunning) {
        [self.currentUnityController applicationWillTerminate:application];
    }
}


- (void)startUnity {
    if (!self.isUnityRunning) {
        self.isUnityRunning = YES;
        [self.currentUnityController applicationDidBecomeActive:self.application];
    }
}

- (void)stopUnity {
    if (self.isUnityRunning) {
        [self.currentUnityController applicationWillResignActive:self.application];
        self.isUnityRunning = NO;
    }
}

@end
