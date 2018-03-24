//
//  TCNavigationViewController.swift
//  TeleController
//
//  Created by yetaiwen on 2017/12/20.
//  Copyright © 2017年 yetaiwen. All rights reserved.
//

import UIKit

class TCNavigationViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationBar.barTintColor = UIColor.init(red: 60/255.0, green: 155/255.0, blue: 207/255.0, alpha: 1.0)
        
       
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

extension TCNavigationViewController{
    override var shouldAutorotate: Bool{
        return false
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask{
        return .portrait
    }
}


