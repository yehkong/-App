//
//  TCViewController.swift
//  TeleController
//
//  Created by yetaiwen on 2017/12/27.
//  Copyright © 2017年 yetaiwen. All rights reserved.
//

import UIKit

class TCViewController: TCHomeViewController {
    
    //    var tcNavigationController: TCNavigationViewController?
    
    var telelistViewController : TCTeleListViewController!
    
    var coverView : UIView?
    
    var mainView : UIView!
    
    var addViewController : TCAddViewController?
    
    var currentViewController : TCCurrentViewController?
    
    var isListShow = false

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //        telelistViewController = Bundle.main.loadNibNamed("TCTeleListViewController", owner: nil, options: nil)?.first as! TCTeleListViewController //不对的写法
        telelistViewController = TCTeleListViewController()
        self.view.addSubview(telelistViewController.view)
        coverView = UIView()
        coverView?.frame = self.view.bounds.offsetBy(dx: 0, dy: 0)
        coverView?.backgroundColor = UIColor.black
        self.view .addSubview(coverView!)
        
        mainView = UIView()
        mainView.frame = self.view.bounds

        
        addViewController = (UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TCAddViewController") as! TCAddViewController)
        mainView.addSubview((addViewController?.view)!)
        currentViewController = (UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TCCurrentViewController") as! TCCurrentViewController)
        mainView.addSubview((currentViewController?.view)!)

        //        tcNavigationController = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TCNavigationViewController") as? TCNavigationViewController
        
        self.view.addSubview(mainView)
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func showTeleControllerList(_ sender: UIBarButtonItem) {
        
        if isListShow {
            UIView.animate(withDuration: 0.35, animations: { [unowned self] in
                
                //            self.currentViewController?.view.center = CGPoint.init(x: ScreenW, y: ScreenH/2)
                //            self.addViewController?.view.center = CGPoint.init(x: ScreenW, y: ScreenH/2)
                //            self.currentViewController?.view.transform = CGAffineTransform.init(scaleX: 0.8, y: 0.8)
                //            self.addViewController?.view.transform = CGAffineTransform.init(scaleX: 0.8, y: 0.8)
                
                self.mainView.center = CGPoint.init(x: ScreenW/2, y: ScreenH/2)
                self.mainView.transform = CGAffineTransform.identity
            }) { (true) in
                self.coverView?.alpha = 1
                
            }
        }else{
            UIView.animate(withDuration: 0.35, animations: { [unowned self] in
                self.coverView?.alpha = 0
                //            self.currentViewController?.view.center = CGPoint.init(x: ScreenW, y: ScreenH/2)
                //            self.addViewController?.view.center = CGPoint.init(x: ScreenW, y: ScreenH/2)
                //            self.currentViewController?.view.transform = CGAffineTransform.init(scaleX: 0.8, y: 0.8)
                //            self.addViewController?.view.transform = CGAffineTransform.init(scaleX: 0.8, y: 0.8)
                
                self.mainView.center = CGPoint.init(x: ScreenW, y: ScreenH/2)
                self.mainView.transform = CGAffineTransform.init(scaleX: 0.8, y: 0.8)
            }) { (true) in
            }
        }
        isListShow = !isListShow
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
