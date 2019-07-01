//
//  AppDelegate.swift
//  3DTouchDemo-Swift
//
//  Created by 贺文杰 on 2019/7/1.
//  Copyright © 2019 贺文杰. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        addShortItem()
        
        return true
    }
    
    func addShortItem()
    {
        let item1 : UIApplicationShortcutItem = UIApplicationShortcutItem.init(type: "openHome", localizedTitle: "主页", localizedSubtitle: "进入主页", icon: UIApplicationShortcutIcon.init(type: .home), userInfo: ["search" : "111111" as NSSecureCoding])
        let item2 : UIApplicationShortcutItem = UIApplicationShortcutItem.init(type: "openLove", localizedTitle: "喜爱", localizedSubtitle: "您有新的喜爱，请查收", icon: UIApplicationShortcutIcon.init(type: .love), userInfo: ["message" : "222222" as NSSecureCoding])
        let item3 : UIApplicationShortcutItem = UIApplicationShortcutItem.init(type: "openShare", localizedTitle: "分享", localizedSubtitle: "分享3D Touch功能", icon: UIApplicationShortcutIcon.init(type: .share), userInfo: ["share" : "333333" as NSSecureCoding])
        
        var mtbAry = UIApplication.shared.shortcutItems
        mtbAry?.removeAll()
        let ary = [item1, item2, item3]
        ary.forEach { (i) in
            mtbAry?.append(i)
        }
        
        UIApplication.shared.shortcutItems = mtbAry
    }
    
    func application(_ application: UIApplication, performActionFor shortcutItem: UIApplicationShortcutItem, completionHandler: @escaping (Bool) -> Void) {
        CCLog("\(shortcutItem.type)")
        switch shortcutItem.type {
        case "openHome":
            break
        case "openLove":
            let mainSB : UIStoryboard = UIStoryboard.init(name: "Main", bundle: nil)
            let contentVC : UIViewController = mainSB.instantiateViewController(withIdentifier: "contentVC")
            var vc : UIViewController = UIApplication.shared.keyWindow?.rootViewController ?? UIViewController.init()
            while (vc.presentedViewController != nil) {
                vc = vc.presentedViewController ?? UIViewController.init()
            }
            vc.present(contentVC, animated: true) {
                
            }
            break
        case "openShare":
            break
        default:
            
            break
        }
    }


    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

