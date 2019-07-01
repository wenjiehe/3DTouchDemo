//
//  AppDelegate.m
//  3DTouchDemo
//
//  Created by 贺文杰 on 2019/6/30.
//  Copyright © 2019 贺文杰. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    
    [self addShortItems];
    
    return YES;
}

//3D Touch只支持
- (void)addShortItems
{
    //3D Touch只支持6s及其以上的设备
    /*
        系统限制每个App最多能够显示4个Action Item。
        用代码方式创建的3D Touch即为动态方式
        用plist文件创建的3D Touch即为静态方式
        如果静态和动态同时使用的时候，给UIApplication的shortcutitems赋值的时候不会覆盖静态创建的items.
     
        UIApplicationShortcutitemType 事件的唯一标识，可以通过这个标识来判别具体点击了哪个事件
        UIApplicationShortcutitemTitle 标题，在没有子标题的情况下如果标题过长能自动换行
        UIApplicationShortcutitemSubtitle 子标题，在标题的下方
        UIApplicationShortcutitemIconType 枚举选取系统中的一个图标类型
        UIApplicationShortcutitemIconFile 自定义一个图标，以单一颜色35 * 35的大小展示，如果设置这个，UIApplicationShortcutitemIconType将不起作用
        UIApplicationShortcutitemUserInfo 字典，里面可以添加信息
     */
    NSMutableArray *mtbAry = (NSMutableArray *)[UIApplication sharedApplication].shortcutItems;
    [mtbAry removeAllObjects];
    UIApplicationShortcutItem *shoreItem1 = [[UIApplicationShortcutItem alloc] initWithType:@"openSearch" localizedTitle:@"搜索" localizedSubtitle:@"搜索很多东西" icon:[UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypeSearch] userInfo:@{@"mark" : @"1111"}];
    
    UIApplicationShortcutItem *shoreItem2 = [[UIApplicationShortcutItem alloc] initWithType:@"openMessage" localizedTitle:@"消息" localizedSubtitle:@"您有新的消息，请查收" icon:[UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypeMessage] userInfo:@{@"message" : @"22222"}];
    
    UIApplicationShortcutItem *shoreItem3 = [[UIApplicationShortcutItem alloc] initWithType:@"openShare" localizedTitle:@"分享" localizedSubtitle:@"分享3D Touch功能" icon:[UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypeShare] userInfo:@{@"share" : @"33333"}];

    [mtbAry addObject:shoreItem1];
    [mtbAry addObject:shoreItem2];
    [mtbAry addObject:shoreItem3];
    
    [UIApplication sharedApplication].shortcutItems = mtbAry;
}

//不管APP在后台还是进程被杀死，只要通过主屏快捷操作进来的，都会调用这个方法
- (void)application:(UIApplication *)application performActionForShortcutItem:(nonnull UIApplicationShortcutItem *)shortcutItem completionHandler:(nonnull void (^)(BOOL))completionHandler
{
    NSLog(@"name:%@\ntype:%@", shortcutItem.localizedTitle, shortcutItem.type);
    if ([shortcutItem.type isEqualToString:@"openSearch"]) { //搜索
        
    }else if ([shortcutItem.type isEqualToString:@"openMessage"]){ //消息
        UIStoryboard *main = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        UIViewController *contentVC = [main instantiateViewControllerWithIdentifier:@"contentVC"];
        UIViewController *vc = [UIApplication sharedApplication].keyWindow.rootViewController;
        while (vc.presentedViewController) {
            vc = vc.presentedViewController;
        }
        [vc presentViewController:contentVC animated:YES completion:^{
            
        }];
    }else if ([shortcutItem.type isEqualToString:@"openShare"]){ //分享
        
    }
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
