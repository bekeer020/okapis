//
//  SecondTableViewController.swift
//  FirstApp
//
//  Created by Abualwaleed on 11/6/16.
//  Copyright © 2016 Alkhaleej. All rights reserved.
//

import UIKit



struct Legue {
    var name:String
    var num:Int
}

class SecondTableViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet var myTable: UITableView!
    
    var Legues:[Legue]?
    var cellID="myCell"
    func LoadData()->[Legue]
    {
        let arr=[Legue(name:"Spain",num:2),Legue(name:"England",num:3),Legue(name:"Italy",num:13)]
        
        return arr
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        Legues=LoadData()
        myTable.delegate=self
        myTable.dataSource=self
    }

    override var prefersStatusBarHidden: Bool{return true}
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return Legues!.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return Legues![section].num
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return Legues![section].name
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=UITableViewCell(style: .default, reuseIdentifier: cellID) as UITableViewCell
        
        cell.textLabel?.text="Row :\(indexPath.row+1)"
        cell.imageView?.image=UIImage(named: Legues![indexPath.section].name)
        
        //cell.accessoryType=UITableViewCellAccessoryType.detailButton
        
        let btn=UIButton()
        btn.frame=CGRect(x: 0, y: 0, width: 100, height: 20)
        btn.setTitle("More", for: UIControlState())
        btn.setTitleColor(UIColor.white, for: UIControlState())
        btn.backgroundColor=UIColor.black
        btn.addTarget(self, action: #selector(MyFunc), for: UIControlEvents.touchUpInside)
        btn.tag=indexPath.row
        cell.accessoryView=btn
        return cell
    }
    
    func MyFunc(sender:UIButton)
    {
         print("Selected \(sender.tag)")
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Selected \(indexPath)")
    }

}
















//             https://github.com/bekeer020/okapis.git
















