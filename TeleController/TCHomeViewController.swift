//
//  TCHomeViewController.swift
//  TeleController
//
//  Created by yetaiwen on 2017/12/20.
//  Copyright © 2017年 yetaiwen. All rights reserved.
//

import UIKit

class TCHomeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //标题
        let mainTitle = NSMutableAttributedString.init(string: NSLocalizedString("万能遥控", comment: ""))
        mainTitle.addAttribute(NSAttributedStringKey.font, value: UIFont.boldSystemFont(ofSize: 21), range: NSMakeRange(0, mainTitle.length))
        let titleLabel = UILabel.init()
        titleLabel.attributedText = mainTitle
        let lableFrame = mainTitle .boundingRect(with: CGSize.init(width: 1000, height: 0), options: .usesLineFragmentOrigin, context: nil)
        titleLabel.frame = lableFrame
        navigationItem.titleView = titleLabel
        //列表item
        navigationItem.leftBarButtonItem = UIBarButtonItem.init(image: UIImage.init(named: "icon_setting"), style: .plain, target: self, action: #selector(showTeleControllerList(_:)))
        //二维码item
        let qr_btn = UIBarButtonItem.init(image: UIImage.init(named: "img_menu_small_2"), style: .plain, target: self, action: #selector(qrAction(_ :)))
        //增加item
        let add_btn = UIBarButtonItem.init(barButtonSystemItem: UIBarButtonSystemItem.add, target: self, action: #selector(addTeleController(_:)))
        self.navigationItem.rightBarButtonItems = [qr_btn,add_btn]
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

//barButtonItem事件
extension TCHomeViewController{
    @objc func showTeleControllerList(_ sender: UIBarButtonItem  ) -> () {
        
    }
    
    @objc func qrAction(_ sender:UIBarButtonItem) -> Void {
        let qrViewController = TCQRViewController.init()
        
        navigationController?.pushViewController(qrViewController, animated: true)
//        present(qrViewController, animated: true, completion: nil)
    }
    
    @objc func addTeleController(_ sender : UIBarButtonItem){
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let addViewController = storyboard.instantiateViewController(withIdentifier: "TCTypeViewController")
        navigationController?.pushViewController(addViewController, animated: true)
    }
}
