//
//  tableViewInteractor.swift
//  Practice
//
//  Created by Berkin Sili on 15.11.2019.
//  Copyright © 2019 Berkin Sili. All rights reserved.
//

import Foundation
import RealmSwift

class CategoryCollectionViewInteractor {
    
    weak var presenter: CategoryCollectionViewPresentationLogic?
    let categoryManager = CategoryManager.sharedInstance
    var displayedCategoryList: Results<Category>?
}

extension CategoryCollectionViewInteractor: CategoryCollectionViewBusinessLogic{
    
    func fetchData() {
        self.displayedCategoryList = categoryManager.getCategoryList()
    }
    
    func itemSelected(at index: Int) {
        let categoryId = self.displayedCategoryList![index].categoryId
        self.presenter?.goToItemDetail(with: categoryId)
        
    }
    
    func itemDeleted(at index: Int) {
        let category = self.displayedCategoryList![index]
        categoryManager.removeCategory(category: category)
    }
    
    func filterItems(by title: String) {
        guard let _ = displayedCategoryList else {
            return
            //TODO: - Handle error gracefully here
        }
        self.displayedCategoryList = categoryManager.filterCategories(with: title)
        self.presenter?.presentList(categories: displayedCategoryList!)
    }
    
    func filterItems(with categoryId: String) {//TODO: - Change this to category type
//        guard let _ = displayedCategoryList else {
//            return
//            //TODO: - Handle error gracefully here
//        }
//        self.displayedCategoryList = categoryManager.filterCategories(with: categoryId)
//        self.presenter?.presentList(categories: displayedCategoryList!)
    }
    
    func markItemAsFinished(at index: Int) {
        //
    }
    
    func markItemAsUnfinished(at index: Int) {
        //
    }
    
    func goToNewItemPage() {
        //
    }
    
    
}
