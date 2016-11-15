//
//  JSONQKViewController.swift
//  FirstApp
//
//  Created by Abualwaleed on 11/15/16.
//  Copyright © 2016 Alkhaleej. All rights reserved.
//

import UIKit

class JSONQKViewController: UIViewController {

    @IBOutlet var txtClientID: UITextField!
    
    @IBOutlet var lblName: UILabel!
    @IBOutlet var lblMobile: UILabel!
    @IBAction func show(_ sender: UIButton) {
       displayActivityIndicator()
        CallWebService()

    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
        messageFrame.frame = CGRect(x: view.frame.midX - 80, y: view.frame.midY - 25 , width: 160, height: 50)
        messageFrame.addSubview(activityIndicator)
        messageFrame.addSubview(strLabel)
        view.addSubview(messageFrame)
    }

    
    
    
    
    
    func CallWebService()
    {
        
        let url=URL(string: "http://www.alkhaleej.com.sa/regsysall/orderservice.svc/GetStudentDetails/"+txtClientID.text!)
        let task=URLSession.shared.dataTask(with: url!, completionHandler: {(data,response,error) in
            
            if error != nil
            {
                print("Error")
            }
            else
            {
                if let content=data
                {
                    DispatchQueue.main.sync {
                        
                    
                    do
                    {
                    let myjson = try JSONSerialization.jsonObject(with: content, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSDictionary
                    print("درس الجمعية الخيرية لتحفيظ القرآن")
                       // print(myjson)
                        
                        if let arr = myjson["Info"] as? NSArray
                        {
                         //   print(arr)
                            if let finfo=arr[0] as? NSDictionary
                            {
                            self.lblName.text=finfo["nameAr"] as? String
                                 self.lblMobile.text=finfo["mobile"] as? String
                                 self.activityIndicator.stopAnimating()
                                self.messageFrame.removeFromSuperview()
                            }//41RAM2844
                        }
                    }
                    catch{}
                        }
                }
            }
        
        })
        task.resume()
        
    }







}
