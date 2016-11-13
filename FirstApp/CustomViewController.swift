//
//  CustomViewController.swift
//  FirstApp
//
//  Created by Abualwaleed on 11/13/16.
//  Copyright © 2016 Alkhaleej. All rights reserved.
//

import UIKit

class CustomViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet var myTable: UITableView!
    
    var students:[Student]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        myTable.delegate=self
        myTable.dataSource=self
        self.students=Help.GetStudents()
    }
    
    override var prefersStatusBarHidden: Bool
        {
    return true
    }
 
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (students?.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell=self.myTable.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! CustomTableViewCell
        cell.myLabel.text=students![indexPath.row].name
        cell.myProgress.setProgress(students![indexPath.row].grade, animated: true)
        cell.myImage.image=UIImage(named: students![indexPath.row].image)
        cell.mySwitch.setOn(students![indexPath.row].acceptance, animated: true)
        
        return cell
    }
    
    
 }
