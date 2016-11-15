//
//  WebViewController.swift
//  FirstApp
//
//  Created by Abualwaleed on 11/1/16.
//  Copyright © 2016 Alkhaleej. All rights reserved.
//

import UIKit

class WebViewController: UIViewController {
    @IBOutlet var myWebBrowser: UIWebView!

    override func viewDidLoad() {
        super.viewDidLoad()

        let ur=URL(string: "http://google.com")
        let req=URLRequest(url: ur!)
        myWebBrowser.loadRequest(req)
        
         
     }
 }
