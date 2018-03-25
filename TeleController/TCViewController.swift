//
//  TCViewController.swift
//  TeleController
//
//  Created by yetaiwen on 2017/12/27.
//  Copyright © 2017年 yetaiwen. All rights reserved.
//

/*
 主View
 */

import UIKit

class TCViewController: TCHomeViewController,updateDataDelegate {

    
    var telelistViewController : TCTeleListViewController!  //列表
    
    var coverView : UIView?
    
    var mainView : UIView!
    
    var addViewController : TCAddViewController?            //添加
    
    var currentViewController : TCCurrentViewController?    //当前
    
    var isListShow = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        telelistViewController = TCTeleListViewController()
        telelistViewController.delegate = self
        self.view.addSubview(telelistViewController.view)
        coverView = UIView()
        coverView?.frame = self.view.bounds.offsetBy(dx: 0, dy: 0)
        coverView?.backgroundColor = UIColor.black
        self.view .addSubview(coverView!)
        
        mainView = UIView()
        mainView.frame = self.view.bounds
        
        
        addViewController = (UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TCAddViewController") as? TCAddViewController)
        mainView.addSubview((addViewController!.view))
        currentViewController = (UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TCCurrentViewController") as? TCCurrentViewController)
        mainView.addSubview((currentViewController!.view))
        
        self.view.addSubview(mainView)
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func showTeleControllerList(_ sender: UIBarButtonItem?) {
        
        if isListShow {
            UIView.animate(withDuration: 0.35, animations: { [unowned self] in
                
                self.mainView.center = CGPoint.init(x: ScreenW/2, y: ScreenH/2)
                self.mainView.transform = CGAffineTransform.identity
            }) { (true) in
                self.coverView?.alpha = 1
            }
        }else{
            UIView.animate(withDuration: 0.35, animations: { [unowned self] in
                self.coverView?.alpha = 0
                
                self.mainView.center = CGPoint.init(x: ScreenW, y: ScreenH/2)
                self.mainView.transform = CGAffineTransform.init(scaleX: 0.8, y: 0.8)
            }) { (true) in
            }
        }
        isListShow = !isListShow
    }
    
    
    override func addTeleController(_ sender: UIBarButtonItem) {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let addViewController = storyboard.instantiateViewController(withIdentifier: "TCTypeViewController") as! TCTypeViewController
        addViewController.delegate = telelistViewController
        navigationController?.pushViewController(addViewController, animated: true)
    }
    
    func updateData(addDevice device: Control_type) {
        isListShow = true
        self.showTeleControllerList(nil)
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
