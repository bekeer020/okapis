//
//  QKViewController.swift
//  FirstApp
//
//  Created by Abualwaleed on 10/30/16.
//  Copyright © 2016 Alkhaleej. All rights reserved.
//

import UIKit

class QKViewController: UIViewController, UITextFieldDelegate{
    @IBOutlet var lblWelcome: UILabel!

    @IBOutlet var txtName: UITextField!
   
    override func viewDidLoad() {
        super.viewDidLoad()
 txtName.delegate=self
      // view.backgroundColor=UIColor.purple
        lblWelcome.text="احمد"
    }

   
    @IBAction func show(_ sender: UITextField) {
        
        lblWelcome.text=txtName.text
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    @IBAction func showMsg(_ sender: UIButton) {
        
        lblWelcome.text=txtName.text
       
    }
    
    override var prefersStatusBarHidden: Bool
        {
    
return true
}
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        txtName.resignFirstResponder()
        return true
    }
}
