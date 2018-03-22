
//  TCTeleListViewController.swift
//  TeleController
//
//  Created by yetaiwen on 2017/12/28.
//  Copyright © 2017年 yetaiwen. All rights reserved.
//

import UIKit
import CoreData

class TCTeleListViewController: TCHomeViewController {

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
        tableView.dataSource = self
        tableView.delegate = self

        dataArr = getData()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func getData() -> (NSArray){
//                let fetchRequest:NSFetchRequest<control_type> = control_type.fetchRequest()
//        let fetchRequest = NSFetchRequest<NSFetchRequestResult>.init(entityName: "control_type")
        let appDelegate  = UIApplication.shared.delegate as! AppDelegate

        let fetchRequest : NSFetchRequest = control_type.fetchRequest()
//        let fetchRequest = NSFetchRequest<NSFetchRequestResult>.init(entityName: "control_type")
        
//        let fetchRequest = control_type.fetchRequest()
//        let entity = NSEntityDescription.entity(forEntityName: "control_type", in: appDelegate.modelManagerContext)
//        fetchRequest.entity = entity
        
        var arr : [Any]?
        
        do {
            arr = try appDelegate.modelManagerContext.fetch(fetchRequest)
        } catch let error as NSError {
            print("fetch request error: \(error)")
        }
        return arr! as NSArray
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
        let cell = UITableViewCell.init(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        cell.textLabel?.text = "\(indexPath.row)"
        return cell
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(indexPath.row)")
    }
    
}
