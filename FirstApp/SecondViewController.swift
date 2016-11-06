//
//  SecondViewController.swift
//  FirstApp
//
//  Created by Abualwaleed on 11/1/16.
//  Copyright © 2016 Alkhaleej. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    @IBOutlet var myImage: UIImageView!
   var imagesArr=["Apple 1.jpg","Apple 2.jpg","Apple 3.jpg"]
    var index:Int=0
    
    @IBAction func changeBackColor(_ sender: UISlider) {
        
        let myG=CGFloat(greenSlider.value)
          let myR=CGFloat(redSlider.value)
          let myB=CGFloat(blueSlider.value)
        
        view.backgroundColor=UIColor(red: myR, green: myG, blue: myB, alpha: 1)
        
        lblsliderValue.text=String( redSlider.value)
      
    }
    
    @IBAction func changeImage(_ sender: UIButton) {
        
        if imagesArr.count==index{index=0}
        myImage.image=UIImage(named: imagesArr[index])
        index=index+1
        
        
        let alert=UIAlertController(title: "Warning", message: "This is alert", preferredStyle: UIAlertControllerStyle.alert)
        
        
        let firseAction=UIAlertAction(title: "Abdulaziz", style: .default, handler: nil)
        
        let sndAction=UIAlertAction(title: "AA", style: .cancel, handler: nil)
        
        alert.addAction(firseAction)
        alert.addAction(sndAction)
       self.present(alert, animated: true, completion: nil)
        
    }
    @IBOutlet var lblsliderValue: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
      changeBackColor(greenSlider)
        
        
      }

    
    @IBAction func showdark(_ sender: UISegmentedControl) {
        
        let value=sender.selectedSegmentIndex
        if value==0 {view.backgroundColor=UIColor.black}
        else
        {
            view.backgroundColor=UIColor.white
        }
    }

    @IBAction func changeImagevisible(_ sender: UISwitch) {
        let x=sender.isOn
        if x==true
        {
            myImage.isHidden=false
        }
        else
        {
            myImage.isHidden=true
        }
        
    }
    
        
    
    
    
}
