//
//  Help.swift
//  FirstApp
//
//  Created by Abualwaleed on 11/13/16.
//  Copyright © 2016 Alkhaleej. All rights reserved.
//

import UIKit

struct Student {
    var name:String
    var image:String
    var acceptance:Bool
    var grade:Float
}


class Help: NSObject {

  class func GetStudents() -> [Student] {
    
    
        let arr=[Student(name:"Ahmad",image:"BusServ.png",acceptance:true,grade:0.9),
        Student(name:"Abdulaziz",image:"Spain.png",acceptance:false,grade:0.6),
        Student(name:"Salem",image:"Italy.png",acceptance:true,grade:1.0),
        Student(name:"Sultan",image:"Spain.png",acceptance:true,grade:0.3),
        Student(name:"Majed",image:"BusServ.png",acceptance:false,grade:0.1)
        ]
        return arr
    
    
    
    }
}
