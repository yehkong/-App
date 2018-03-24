
//  TCTeleListViewController.swift
//  TeleController
//
//  Created by yetaiwen on 2017/12/28.
//  Copyright © 2017年 yetaiwen. All rights reserved.
//

import UIKit
import CoreData

class TCTeleListViewController: TCHomeViewController,updateDataDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var dataArr : NSArray!{
        didSet{
            tableView.reloadData()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        self.automaticallyAdjustsScrollViewInsets = true
        tableView.backgroundColor = UIColor.white
//        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        tableView.delegate = self

        dataArr = getControls() as NSArray
        print("count:\(getControlCount())")
        
        tableView.tableFooterView = UIView()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
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
    
    func updateData(addDevice device: Control_type) {
        dataArr = self.getControls() as NSArray
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension TCTeleListViewController : UITableViewDataSource,UITableViewDelegate{
    
    

    
    ///ytw TalbeViewDataSource //
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let device : Control_type = dataArr[indexPath.row] as! Control_type
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        //FIXME: fix it
        if cell === nil {
            cell = UITableViewCell.init(style:.subtitle, reuseIdentifier: "cell")
        }
        cell?.detailTextLabel?.text = "\(device.name_ch ?? "name")"
        cell?.detailTextLabel?.textColor = UIColor.darkText
        cell?.textLabel?.text = "\(device.define_ID)"
        return cell!
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(indexPath.row)")
    }
    
}
