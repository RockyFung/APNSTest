//
//  AppDelegate.m
//  APNSTest
//
//  Created by lanou on 15/11/17.
//  Copyright © 2015年 RockyFung. All rights reserved.
//

#import "AppDelegate.h"
#import "XGPush.h"
#import "XGSetting.h"


@interface AppDelegate ()

@end

@implementation AppDelegate



- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    // 初始化信鸽 到信鸽官网申请APPKEY
    [XGPush startApp:2200163966 appKey:@"I2BU9I1QC79P"];
    
    

    // 获取系统当前版本，如果大于8.0就使用最新的创建方法，如果小于8.0就使用8.0已经弃用的方法
    if ([UIDevice currentDevice].systemVersion.floatValue > 8.0) {
        // 注册推送
        UIUserNotificationSettings *set = [UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeAlert | UIUserNotificationTypeBadge | UIUserNotificationTypeSound categories:nil];
        [application registerUserNotificationSettings:set];
        
        // 开启推送
        [application registerForRemoteNotifications];
        
    }else{
        [application registerForRemoteNotificationTypes:UIUserNotificationTypeAlert | UIUserNotificationTypeBadge |UIUserNotificationTypeSound];
    }
    
    
    
    
    return YES;
}

// 推送成功后返回的token,我们使用信鸽进行解析、
- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken
{
    // 获取token的字符串
    NSString *token = [XGPush registerDevice:deviceToken];
    NSLog(@"%@",token);
}


// 点击应用后获取推送的信息
- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo
{
   
    // 角标滞空
    application.applicationIconBadgeNumber = 0;
     NSLog(@"%@",userInfo);
}







- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
