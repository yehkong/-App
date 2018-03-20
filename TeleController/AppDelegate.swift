//
//  AppDelegate.swift
//  TeleController
//
//  Created by yetaiwen on 2017/12/20.
//  Copyright © 2017年 yetaiwen. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    //context 延迟加载
    lazy var modelManagerContext: NSManagedObjectContext = {
        let managerContext = NSManagedObjectContext.init(concurrencyType: NSManagedObjectContextConcurrencyType.mainQueueConcurrencyType)
        managerContext.persistentStoreCoordinator = self.managerModelCoordinator
        return managerContext
    }()
    //Model
    lazy var managerModel : NSManagedObjectModel = {
        let objectModel = NSManagedObjectModel.mergedModel(from: nil)
        return objectModel!
    }()
    
    //coordinator
    lazy var managerModelCoordinator : NSPersistentStoreCoordinator = {
        let modelCoordinator = NSPersistentStoreCoordinator.init(managedObjectModel: self.managerModel)
        let url = Bundle.main.resourceURL?.appendingPathComponent("tsg_temp.db")
        do{
            try modelCoordinator.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil, at: url, options: nil)
        }catch let error as NSError{
            
        }
        
        return modelCoordinator
    }()
    
    func saveCoreDataContext() {
        if self.modelManagerContext.hasChanges {
            do{
               try self.modelManagerContext.save()
            }catch{
                
            }
        }else{
            
        }
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
//        let storyBoard = UIStoryboard.init(name: "Main", bundle: Bundle.main)
//        let addViewController = storyBoard.instantiateViewController(withIdentifier: "TCAddViewController")
        //
        //
        //        let firstPageController = TCNavigationViewController.init(rootViewController: addViewController)
        
        //        let addViewController = storyBoard .instantiateViewController(withIdentifier: "TCCurrentViewController")
        //
        //
        //        let firstPageController = TCNavigationViewController.init(rootViewController: addViewController)
        //
        //        let firstPageController = TCNavigationViewController.init(rootViewController: TCViewController.init())
        
        
                let firstPageController = TCNavigationViewController.init(rootViewController: TCTeleListViewController())
                window?.rootViewController = firstPageController
                window?.makeKeyAndVisible()
        
        return true
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

