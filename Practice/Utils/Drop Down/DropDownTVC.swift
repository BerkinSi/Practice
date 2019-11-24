//
//  DropDownTVC.swift
//  Practice
//
//  Created by Berkin Sili on 24.11.2019.
//  Copyright © 2019 Berkin Sili. All rights reserved.
//

import UIKit

class DropDownTVC: UITableViewCell {
    
    @IBOutlet weak var optionLabel: UILabel!
    

    func configure(text: String) {
        self.optionLabel.text = text
    }
}
