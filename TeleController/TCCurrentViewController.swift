//
//  TCCurrentViewController.swift
//  TeleController
//
//  Created by yetaiwen on 2017/12/20.
//  Copyright © 2017年 yetaiwen. All rights reserved.
//

import UIKit

class TCCurrentViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func powerBtnAction(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        
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
extension TCCurrentViewController{
    func showTeleControllerList(_ sender: UIBarButtonItem) {
        self.view.center = CGPoint.init(x: ScreenW, y: ScreenH/2)
        self.navigationController?.view.center = CGPoint.init(x: ScreenW, y: ScreenH/2)
        self.view.transform = CGAffineTransform.init(scaleX: 0.8, y: 0.8)
        self.navigationController?.view.transform = CGAffineTransform.init(scaleX: 0.8, y: 0.8)
    }
}
