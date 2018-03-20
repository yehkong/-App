//
//  TCTypeViewController.swift
//  TeleController
//
//  Created by yetaiwen on 2017/12/21.
//  Copyright © 2017年 yetaiwen. All rights reserved.
//

import UIKit

let ScreenW = UIScreen.main.bounds.size.width
let ScreenH = UIScreen.main.bounds.size.height

class TCTypeViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    private let CellID = "TCTypeCollectionViewCell"
    
    lazy var devieTypeArr : NSMutableArray = {
        let arr = NSMutableArray()
        arr.addObjects(from: ["img_device_air_cleaner","img_device_air_condition","img_device_amplifier","img_device_box","img_device_dvd","img_device_fan","img_device_light","img_device_projector","img_device_slr","img_device_stb","img_device_tv","img_device_water_heater"])
        return arr
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = NSLocalizedString("选择设备", comment: "")
        //        let collectionViewLayout = UICollectionViewFlowLayout.init()
        //        collectionViewLayout.itemSize = CGSize.init(width: (375 - 40)/3, height: (375 - 40)/3)
        //        collectionViewLayout.minimumLineSpacing = 10.0
        //        collectionViewLayout.minimumInteritemSpacing = 10.0
        //        collectionViewLayout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10)
        //        collectionViewLayout.scrollDirection = .vertical
        //        collectionView.collectionViewLayout = collectionViewLayout
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
        let gesture = UITapGestureRecognizer.init(target: self, action: #selector(choiseTeleDevice(_:)))
        cell?.contentView .addGestureRecognizer(gesture)
        return cell!
        
    }
}

extension TCTypeViewController{
    @objc func choiseTeleDevice(_ sender:UIGestureRecognizer) -> () {
        print("选择了设备")
    }
}
