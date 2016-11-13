//
//  JsonViewController.swift
//  FirstApp
//
//  Created by Abualwaleed on 11/6/16.
//  Copyright © 2016 Alkhaleej. All rights reserved.
//

import UIKit

class JsonViewController: UIViewController,UITextFieldDelegate {

  
   
    @IBOutlet var txtClientID: UITextField!
    @IBOutlet var lbl1: UILabel!
    @IBOutlet var lbl2: UILabel!
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        txtClientID.resignFirstResponder()
    }
    
    @IBAction func showData(_ sender: UIButton) {
        displayActivityIndicator()
        doitbyself()
    }
    
    
    let activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.white)
    // you will need a new view for your activity indicator and a label for your message
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

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        txtClientID.resignFirstResponder()
        return true
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        txtClientID.delegate=self
        // call your activity indicator method

    
//        let url=URL(string: "http://api.fixer.io/latest")
//        //let url=URL(string: "http://www.alkhaleej.com.sa/regsysall/orderservice.svc/GetStudentDetails/41ram2844")
//        let task=URLSession.shared.dataTask(with: url!, completionHandler: {(data,response,error) in
//        
//            if error != nil
//            {
//                print("Error")
//            }
//            else
//            {
//              if let content=data
//              {
//                     do
//                        {
//                            let myjson = try JSONSerialization.jsonObject(with: content, options: JSONSerialization.ReadingOptions.mutableContainers) as AnyObject
//                           // print(myjson)
//                            
//                            if let rates=myjson["rates"] as? NSDictionary
//                            {
//                                print(rates)
//                                if let currency=rates["CAD"]
//                                {
//                                    print("=================")
//                                    print(currency)
//                                    
//                                }
//                            }
//                        }
//                
//                     catch
//                        {
//                    
//                        }
//              }
//            }
//        })
//        task.resume()
        
            }
 
    func doitbyself()
    {
        
        
        // let url=URL(string: "http://api.fixer.io/latest")
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
                    DispatchQueue.main.async {
                        do
                        {
                            let myjson = try JSONSerialization.jsonObject(with: content, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSDictionary
                            print("======   All   ====")
                            print(myjson)
                            
                            if let arr=myjson["Info"] as? NSArray
                            {
                                print("===== Info  =====")
                                print(arr)
                                
                                if let currency=arr[0] as? NSDictionary
                                {
                                    self.lbl1.text=(currency["nameAr"] as? String)?.description
                                    self.lbl2.text=(currency["mobile"] as? String)?.description
                                    print("======= Arabic Name ==========")
                                    print("\(currency["nameAr"])")
                                    self.activityIndicator.stopAnimating()
                                    self.messageFrame.removeFromSuperview()
                                }
                            }
                        }
                            
                        catch
                        {
                            
                        }
                    }
                }
                
            }
            
            
        })
        task.resume()
        

    }
}
