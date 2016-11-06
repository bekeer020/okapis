//
//  HomeTableViewController.swift
//  FirstApp
//
//  Created by Abualwaleed on 11/6/16.
//  Copyright © 2016 Alkhaleej. All rights reserved.
//

import UIKit

class HomeTableViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet var myTable: UITableView!
    var CellID="MyCell"
    
    var users=["Abdulaziz","Ahmad","Azooz","Wail"]
    var refresher:UIRefreshControl?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        myTable.delegate=self
        myTable.dataSource=self
        
        
        self.refresher=UIRefreshControl()
        self.refresher!.attributedTitle=NSAttributedString(string: "Pull to refresh")
        self.refresher!.addTarget(self, action: #selector(RefFunc), for: UIControlEvents.valueChanged)
        self.myTable.addSubview(refresher!)
 
    }

    func RefFunc()  {
        print("Refreshed")
        let rDate=Date()
        users.append(rDate.description)
        myTable.reloadData()
        refresher?.endRefreshing()
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell=UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: CellID) as UITableViewCell
        
        cell.textLabel?.text=users[indexPath.row]
        
        return cell
    }
    
    override var prefersStatusBarHidden: Bool
        {
            return true
    }
    

}
