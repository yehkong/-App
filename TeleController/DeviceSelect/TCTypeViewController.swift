//
//  TCTypeViewController.swift
//  TeleController
//
//  Created by yetaiwen on 2017/12/21.
//  Copyright © 2017年 yetaiwen. All rights reserved.
//

import UIKit
import CoreData

//协议，用于通知和传值
protocol updateDataDelegate{
    func updateData(addDevice device : Control_type) -> ()
}

let ScreenW = UIScreen.main.bounds.size.width
let ScreenH = UIScreen.main.bounds.size.height

class TCTypeViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var delegate : updateDataDelegate?
    
    private let CellID = "TCTypeCollectionViewCell"
    
    lazy var devieTypeArr : NSMutableArray! = {
        let arr = NSMutableArray()
        arr.addObjects(from: ["img_device_air_cleaner","img_device_air_condition","img_device_amplifier","img_device_box","img_device_dvd","img_device_fan","img_device_light","img_device_projector","img_device_slr","img_device_stb","img_device_tv","img_device_water_heater"])
        return arr
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = NSLocalizedString("选择设备", comment: "")
      
        collectionView.collectionViewLayout = TCCollectionLayout()
        
        collectionView.register(UINib.init(nibName: CellID, bundle: nil), forCellWithReuseIdentifier: CellID)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

extension TCTypeViewController : UICollectionViewDataSource,UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.devieTypeArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellID, for: indexPath) as? TCTypeCollectionViewCell
        let img = UIImage.init(named: devieTypeArr.object(at: indexPath.item) as! String)
        cell?.TeleImageView.image = img
        cell?.TeleLabel.text = "设备\(indexPath.item)"
        //        let gesture = UITapGestureRecognizer.init(target: self, action: #selector(choiseTeleDevice(_:)))
        //        cell?.contentView .addGestureRecognizer(gesture)
        return cell!
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let device = NSEntityDescription.insertNewObject(forEntityName: "Control_type", into: appDelegate.modelManagerContext) as! Control_type
        device.define_ID = Int16(indexPath.item)
        device.name_ch = "设备\(indexPath.item)" + "-\(arc4random()%100)"
        appDelegate.saveCoreDataContext()
        delegate?.updateData(addDevice: device)
        let alertView = UIAlertController.init(title:nil, message: "添加成功，可返回列表查看", preferredStyle: UIAlertControllerStyle.alert)
        alertView.addAction(UIAlertAction.init(title: "OK", style: UIAlertActionStyle.cancel, handler: { (action) in
        }))
        present(alertView, animated: true) {
        }
        
    }
}

extension TCTypeViewController{
    @objc func choiseTeleDevice(_ sender:UIGestureRecognizer) -> () {
        print("选择了设备")
    }
}
