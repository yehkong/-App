
一个对设备进行添加删除等管理的简单的App Demo，CoreData数据库操作

序言：先简单展示一下本工程项目介绍博客[YTCoreDataProject](https://www.jianshu.com/p/cb142031d06d)实现效果的主页截图：
> ![1.png](https://upload-images.jianshu.io/upload_images/2737326-23975555d13f6d83.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
这个工程主要实现了添加设备到数据库，已经进行列表展示，并且可以删除数据库设备，以及其他一些子功能。
以下是这个工程的一些主要功能开发说明：
* 1.  数据库模型
> ![3.png](https://upload-images.jianshu.io/upload_images/2737326-dc07ffa97df75251.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
注意Entity名字必须大写开头。也可以直接转成代码
![4.png](https://upload-images.jianshu.io/upload_images/2737326-b12cb4e0e2315614.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
![5.png](https://upload-images.jianshu.io/upload_images/2737326-c3d36aa896ca8d21.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
需要说明的是，这两种方式取其一，否则会冲突。
* 2.  CoreData技术栈
```
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
```
> 分别定义了上下文，模型，模型协调器三个延迟加载变量，以及数据库保存操作。
* 3.  进行数据库搜索和展示
```
// 获取所有数据
    func getControls() -> [Control_type] {
        let fetchRequest = NSFetchRequest<Control_type>.init(entityName: "Control_type")
        do {
            let appDelegate  = UIApplication.shared.delegate as! AppDelegate
            let result = try appDelegate.modelManagerContext.fetch(fetchRequest)
            return result
        } catch let err as NSError{
            print(err.description)
            //            fatalError();
        }
        return [Control_type]()
    }
    
    //获取数据库数据数目
    func getControlCount() -> Int {
        let fetch : NSFetchRequest<Control_type> = Control_type.fetchRequest()
        var result : Int = 0
        do{
            let appDelegate  = UIApplication.shared.delegate as! AppDelegate
            result = try appDelegate.modelManagerContext.count(for: fetch)
        }catch let err{
            print("\(err)")
        }
        return result
    }
```
* 4.  数据库删除数据
```
//长按cell删除
    @objc func longPressAction(_ gesture: UIGestureRecognizer) -> () {
        if gesture.state == UIGestureRecognizerState.began {
            
            let  alertView =  UIAlertController.init(title: "确认删除", message: nil, preferredStyle: .alert)
            let alertAction = UIAlertAction.init(title: "OK", style: .default, handler: {  [unowned self] (action) in
                let cell = gesture.view as! UITableViewCell
                let indexPath = self.tableView.indexPath(for: cell)
                
                let device = self.dataArr[indexPath!.row] as! Control_type
                let fetchQequest = NSFetchRequest<NSFetchRequestResult>.init(entityName: "Control_type")
                let predicate = NSPredicate.init(format: "name_ch = %@", device.name_ch!)
                fetchQequest.predicate = predicate
                let appDelegate = UIApplication.shared.delegate as! AppDelegate
                do{
                    let arr = try appDelegate.modelManagerContext.fetch(fetchQequest)
                    let kdevice = arr.first as! Control_type
                    appDelegate.modelManagerContext.delete(kdevice)
                    appDelegate.saveCoreDataContext()
                }catch{
                    
                }
                self.dataArr = self.getControls() as NSArray
            })
            
            alertView.addAction(alertAction)
            
            present(alertView, animated: true, completion: nil)
        }
    }
```
* 5.  工程还进行其他一下配套功能的编写，对应的技术博客为：[YTCoreDataProject](https://www.jianshu.com/p/cb142031d06d)


