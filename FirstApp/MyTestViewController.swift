//
//  MyTestViewController.swift
//  FirstApp
//
//  Created by Abualwaleed on 11/16/16.
//  Copyright © 2016 Alkhaleej. All rights reserved.
//

import UIKit

 
class MyTestViewController: UIViewController,MyPopupViewControllerDelegate {
    
    
    
    @IBAction func btnShow(_ sender: UIButton) {
        
            self.displayViewController(.bottomTop)
    }

    
    func displayViewController(_ animationType: SLpopupViewAnimationType) {
        
        let myPopupViewController:MyPopupViewController = MyPopupViewController(nibName:"MyPopupViewController", bundle: nil)
        myPopupViewController.delegate = self
        self.presentpopupViewController(myPopupViewController, animationType: animationType, completion: { () -> Void in
            
        })
    }
    
    func pressOK(_ sender: MyPopupViewController) {
        self.dismissPopupViewController(.fade)
    }
    func pressCancel(_ sender: MyPopupViewController) {
        
        self.dismissPopupViewController(.bottomBottom)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addBackgroundImage1()
        
    }
    
    
     
   
}
