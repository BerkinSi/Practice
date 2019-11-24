//
//  CategoryCVCell.swift
//  Practice
//
//  Created by Berkin Sili on 18.11.2019.
//  Copyright © 2019 Berkin Sili. All rights reserved.
//

import UIKit

class CategoryCVCell: UICollectionViewCell {
    
    @IBOutlet weak var categoryIcon: UIImageView!
    @IBOutlet weak var categoryTitle: UILabel!
    @IBOutlet weak var categoryItemsTableView: UITableView!
    @IBOutlet weak var progressViewLength: NSLayoutConstraint!
    @IBOutlet weak var categoryCellStack: UIStackView!
    
    
    @IBOutlet weak var addNewCategoryView: UIView!
    @IBOutlet weak var addCategoryImage: UIImageView!//TODO: Add Image
    @IBOutlet weak var addCategoryLabel: UILabel!
    
    //Constants
    let addNewCategoryText = "Add New Category"
    
    
    var itemList: [CategoryListItemVM] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func prepareForReuse() {
        self.categoryCellStack.isHidden = false
        self.addNewCategoryView.isHidden = true
    }
    
    func configureCell(category: CategoryVM?) {
        if nil != category {
            configureAsCategoryCell(category: category!)
        }else {
            configureAsNewCategoryCell()
        }
    }
    
    //MARK: - Private Functions
    
    private func configureAsCategoryCell(category: CategoryVM) {
        addNewCategoryView.isHidden = true
        categoryCellStack.isHidden = false
        categoryTitle.text = category.title
        itemList = category.categoryItemList
        setProgressViewLength()
        setTableView()
        //TODO: - self.backgroundView?.backgroundColor = UIColor(named: category.categoryColorName)
        //TODO: - add icon self.categoryIcon
    }
    
    private func configureAsNewCategoryCell() {
        //TODO: - Configure
        addNewCategoryView.isHidden = false
        categoryCellStack.isHidden = true
        addCategoryLabel.text = addNewCategoryText
    }
    
    private func setTableView() {
        registerTableViewCells()
        categoryItemsTableView.delegate = self
        categoryItemsTableView.dataSource = self
        categoryItemsTableView.reloadData()
    }
    
    private func registerTableViewCells() {
        let tableViewCell = UINib(nibName: "CategoryItemTVC", bundle: nil)
        self.categoryItemsTableView.register(tableViewCell, forCellReuseIdentifier: "CategoryItemTVC")
    }
    
    private func setProgressViewLength() {
        var completedItemCount = 0
        self.itemList.forEach { (item) in
            if item.isDone {
                completedItemCount += 1
            }
        }
        guard 0 < self.itemList.count else {
            self.progressViewLength.constant = 0
            return
        }
        self.progressViewLength.constant = CGFloat(completedItemCount / self.itemList.count )
    }
}
    //MARK: - Table View Functions
extension CategoryCVCell: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0//TODO: - Do it
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //TODO: - Do it
        return UITableViewCell()
    }
}

extension CategoryCVCell: UITableViewDelegate {
}
