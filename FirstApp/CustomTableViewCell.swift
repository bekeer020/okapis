//
//  CustomTableViewCell.swift
//  FirstApp
//
//  Created by Abualwaleed on 11/13/16.
//  Copyright © 2016 Alkhaleej. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet var myLabel: UILabel!
    @IBOutlet var mySwitch: UISwitch!
    @IBOutlet var myImage: UIImageView!
    @IBOutlet var myProgress: UIProgressView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
