//
//  AppDelegate.m
//  tutorial_libcurl_iOS
//
//  Created by itman on 2019/3/2.
//  Copyright © 2019 veryitman. All rights reserved.
//

#import "AppDelegate.h"
#import "curl/curl.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // 初始化其内部所有模块
    // 应用程序启动初始化一次即可
    CURLcode res = curl_global_init(CURL_GLOBAL_ALL);
    
    /* Check for errors */
    if (CURLE_OK != res) {
        fprintf(stderr, "curl_global_init() failed: %s\n", curl_easy_strerror(res));
    }
    
    char *msld[] = {"msld", "sdk", "support"};
    NSLog(@"%s, %c, %c", msld[2], *msld[2], *(msld[2]));
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    curl_global_cleanup();
}

@end
