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
    //context
    lazy var modelManagerContext: NSManagedObjectContext = {
        let managerContext = NSManagedObjectContext.init(concurrencyType: NSManagedObjectContextConcurrencyType.mainQueueConcurrencyType)
        managerContext.persistentStoreCoordinator = self.managerModelCoordinator
        return managerContext
    }()
    //Model
    lazy var managerModel : NSManagedObjectModel = {
        let objectModel = NSManagedObjectModel.mergedModel(from: nil)
        //        let url = Bundle.main.url(forResource:"YTModel", withExtension: "momd")
        //       let objectModel = NSManagedObjectModel.init(contentsOf: url!)
        return objectModel!
    }()
    
    //coordinator
    lazy var managerModelCoordinator : NSPersistentStoreCoordinator = {
        let modelCoordinator = NSPersistentStoreCoordinator.init(managedObjectModel: self.managerModel)
        //        let url = Bundle.main.resourceURL?.appendingPathComponent("tsg_temp1.db")
        let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first
        let targetPath = documentsPath! + "/tsg_temp.db"
        do{
            try modelCoordinator.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil, at: NSURL.init(fileURLWithPath: targetPath) as URL, options: nil)
        }catch let error as NSError{
            print("persistent store:error:\(error)")
        }
        
        return modelCoordinator
    }()
    //保存数据库操作
    func saveCoreDataContext() {
        if self.modelManagerContext.hasChanges {
            do{
                try self.modelManagerContext.save()
            }catch let err as NSError{
                print("save error:\(err)")
            }
        }else{
            
        }
    }
    //写入初始化数据,暂时未用
    func writeDataToDB() {

        for i in 0..<9 {
            
            let entity : Control_type = NSEntityDescription.insertNewObject(forEntityName: "Control_type", into: self.modelManagerContext) as! Control_type
            entity.define_ID = Int16(i);
            entity.name_ch = "name\(i)"
            self.saveCoreDataContext()
        }
    }
    
    //copy外部数据库,暂时未用
    func copyDbToDocumentsPath() -> Bool {
        var sus = true
        let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first
        let targetPath = documentsPath! + "/tsg_temp.db"
        let isexist = FileManager.default.fileExists(atPath: targetPath)
        if !isexist {
            do{
                try FileManager.default.copyItem(atPath: (Bundle.main.resourcePath! + "/tsg_temp.db")
                    , toPath: targetPath)
            }catch  let err as NSError{
                sus = false
                print(err.description)
            }
        }
        return sus
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
        let firstPageController = TCNavigationViewController.init(rootViewController: TCViewController.init())
        
        //                let firstPageController = TCNavigationViewController.init(rootViewController: TCTeleListViewController())
        
//        writeDataToDB()
        
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

