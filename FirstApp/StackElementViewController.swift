//
//  StackElementViewController.swift
//  FirstApp
//
//  Created by Abualwaleed on 11/25/16.
//  Copyright © 2016 Alkhaleej. All rights reserved.
//

import UIKit

class StackElementViewController: UIViewController {

    @IBOutlet var headerLabelTitle: UILabel!
    
    
    var headerString:String? {
        didSet {
            configureView()
        }
    }
    
    func configureView() {
        headerLabelTitle.text = headerString
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
}
