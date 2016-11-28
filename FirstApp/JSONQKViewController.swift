//
//  JSONQKViewController.swift
//  FirstApp
//
//  Created by Abualwaleed on 11/15/16.
//  Copyright © 2016 Alkhaleej. All rights reserved.
//

import UIKit
import PaperOnboarding

class JSONQKViewController: UIViewController,UITextFieldDelegate {
    @IBOutlet var mybackgroundParallex: UIImageView!
    let transition = CircularTransition()
    @IBOutlet var btnShow: UIButton!
    @IBOutlet var txtClientIDCons: NSLayoutConstraint!
    @IBOutlet var txtPasswordCons: NSLayoutConstraint!
    @IBOutlet var txtClientID: UITextField!
    @IBOutlet var txtPassword: UITextField!
    
    @IBOutlet var lblName: UILabel!
    @IBOutlet var lblMobile: UILabel!
    
    @IBAction func show(_ sender: UIButton) {
        let bounds = self.btnShow.bounds
        UIView.animate(withDuration: 1.0, delay: 0.0, usingSpringWithDamping: 0.2, initialSpringVelocity: 10, options: [], animations: {
            self.btnShow.bounds = CGRect(x: bounds.origin.x - 20, y: bounds.origin.y, width: bounds.size.width + 60, height: bounds.size.height)
            //self.btnShow.isEnabled = false
        }, completion: nil)
        
       displayActivityIndicator()
        CallWebService()

    }
    override func viewDidLoad() {
        super.viewDidLoad()

        self.txtClientID.delegate=self
        self.txtPassword.delegate=self
       //self.view.addBackgroundImage1()
        
        applayMotionEffect(toView: mybackgroundParallex, magnitude: 40)
        
    }
    
    
    func applayMotionEffect(toView view:UIView, magnitude:Float) {
        
        let xMotion=UIInterpolatingMotionEffect(keyPath: "center.x", type: .tiltAlongHorizontalAxis)
        xMotion.minimumRelativeValue = -magnitude
        xMotion.maximumRelativeValue=magnitude
        
        let yMotion=UIInterpolatingMotionEffect(keyPath: "center.y", type: .tiltAlongVerticalAxis)
        yMotion.minimumRelativeValue = -magnitude
        yMotion.maximumRelativeValue=magnitude
        
        let group=UIMotionEffectGroup()
        group.motionEffects=[xMotion,yMotion]
        
        view.addMotionEffect(group)
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
         print("View Will Appear\(self.txtClientIDCons.constant.description)")
        txtClientIDCons.constant -= view.bounds.width
        txtClientID.alpha=0.9
        txtPassword.alpha=0.9
        txtClientID.layer.cornerRadius=0
        txtPasswordCons.constant -= view.bounds.width
        btnShow.alpha = 0.0
        
        let myColor : UIColor = UIColor.white
        self.txtClientID.layer.borderColor = myColor.cgColor
        self.txtClientID.layer.borderWidth=1
        self.txtPassword.layer.borderColor = myColor.cgColor
        self.txtPassword.layer.borderWidth=1

        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.txtClientID.placeholder="Please Enter Client ID"
        self.txtPassword.placeholder="Please Enter Password"
        
        UIView.animate(withDuration: 0.5, delay: 0.0, options: UIViewAnimationOptions.curveEaseInOut, animations: {
                    print(self.txtClientIDCons.constant.description)
               print(self.view.bounds.width.description)
            
                        self.txtClientIDCons.constant += self.view.bounds.width
            self.view.layoutIfNeeded()
        }, completion: nil)

        UIView.animate(withDuration: 0.5, delay: 0.5, options: .curveEaseOut, animations: {
            self.txtPasswordCons.constant += self.view.bounds.width
            self.view.layoutIfNeeded()
        }, completion: nil)
        
        UIView.animate(withDuration: 2.0, delay: 1.5, options: .curveEaseOut, animations: {
            self.btnShow.alpha = 0.9
        }, completion: nil)
        
    }

    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        txtClientID.resignFirstResponder()
        txtPassword.resignFirstResponder()
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        txtClientID.resignFirstResponder()
        txtPassword.resignFirstResponder()
        return true
    }
    
    
    
    

     let activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.white)
     let messageFrame = UIView()
        let strLabel = UILabel(frame: CGRect(x: 50, y: 0, width: 160, height: 50))

    func displayActivityIndicator() {
       
               strLabel.text = "Loading Data"
        strLabel.textColor = UIColor.white
        messageFrame.layer.cornerRadius = 15
        messageFrame.backgroundColor = UIColor(white: 0, alpha: 0.7)
        activityIndicator.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        activityIndicator.startAnimating()
        messageFrame.frame = CGRect(x: view.frame.midX-80 , y: view.frame.midY-25 , width: 160, height: 50)
        messageFrame.addSubview(activityIndicator)
        messageFrame.addSubview(strLabel)
        view.addSubview(messageFrame)
    }

    
   
    func CallWebService()
    {
        
        let url=URL(string: "http://www.alkhaleej.com.sa/regsysall/orderservice.svc/GetStudentTR/"+txtClientID.text!+"/"+txtPassword.text!)
        let task=URLSession.shared.dataTask(with: url!, completionHandler: {(data,response,error) in
               DispatchQueue.main.sync {
            if error != nil
            {
                print("Error")
            }
            else
            {
                 if let content=data
                {

                    do
                    {
                    let myjson = try JSONSerialization.jsonObject(with: content, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSDictionary
                   // print("درس الجمعية الخيرية لتحفيظ القرآن")
                       // print(myjson)
                        
                        if let arr = myjson["Info"] as? NSArray
                        {
                            if arr.count==0
                            {
                                self.activityIndicator.stopAnimating()
                                self.messageFrame.removeFromSuperview()
                                self.txtPassword.text=nil
                                self.lblName.text=nil
                                self.lblMobile.text=nil
                            }
                            else if let finfo=arr[0] as? NSDictionary
                            {
                            self.lblName.text=finfo["nameAr"] as? String
                                self.lblMobile.text=finfo["mobile"] as? String
                                self.activityIndicator.stopAnimating()
                                self.messageFrame.removeFromSuperview()
                                
                                
                                let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "JsonViewController") as! JsonViewController
                                                                self.presentpopupViewController(secondViewController, animationType: .fade, completion: {})
                            }//41RAM2844
                        }
                    }
                    catch
                    {
                        self.activityIndicator.stopAnimating()
                        self.messageFrame.removeFromSuperview()
                    }
                        }
                }
            }
        
        })
        task.resume()
        
    }







}
