//
//  CategoryItemTVC.swift
//  Practice
//
//  Created by Berkin Sili on 19.11.2019.
//  Copyright © 2019 Berkin Sili. All rights reserved.
//

import UIKit

class CategoryItemTVC: UITableViewCell {
    
    @IBOutlet weak var bulletImage: UIImageView!
    @IBOutlet weak var checkMarkImage: UIImageView!
    @IBOutlet weak var title: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
        
    func configureCell(itemVM: CategoryListItemVM) {
        if nil == itemVM.moreItems {
            title.text = itemVM.title
            checkMarkImage.isHidden = !itemVM.isDone
            let bulletImageName = itemVM.isDone ? "arrow.right.circle.fill" : "arrow.right.circle"
            bulletImage.image = UIImage(systemName: bulletImageName)
        }else {
            title.text = "\(itemVM.moreItems!) more items..."//TODO: - Add localization
            checkMarkImage.isHidden = true
            bulletImage.isHidden = true
        }
    }
}
