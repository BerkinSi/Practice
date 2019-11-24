//
//  CreateItemInteractor.swift
//  Practice
//
//  Created by Berkin Sili on 23.11.2019.
//  Copyright © 2019 Berkin Sili. All rights reserved.
//

import Foundation
import RealmSwift

class CreateItemInteractor{
    
    //MARK: Constants
    let couldNotFetchCategoryListError = "Could Not Fetch Category List"
    let itemAddedSuccesfully = "Item added succesfully"
    let noSuchCategory = "Category Index is out of range"
    let fieldsAreNotValid = "Please Enter all necessary fields"//TODO: Handle this one better
    
    weak var presenter: CreateItemPresentationLogic?
    let itemManager = ItemManager.sharedInstance
    let categoryManager = CategoryManager.sharedInstance
    
    var categoryList: Results<Category>?
    
    
    //MARK: - Private Functions
    private func isItemValid(item: CreateItemModel) -> Bool{
        
        if item.parentCategoryIndex < 0 || item.parentCategoryIndex >= categoryList.count{
            return false
        }else if item.itemName.isEmpty {
            return false
        }
        return true
    }
}

extension CreateItemInteractor: CreateItemBusinessLogic {
    func vcInitialized() {
        categoryList = self.categoryManager.getCategoryList()
        guard let _ = categoryList else {
            presenter?.showError(message: couldNotFetchCategoryListError)
            return
        }
        self.presenter?.presentVC(categoryList: categoryList!)
    }
    
    func getCategoryList() {
        categoryList = self.categoryManager.getCategoryList()
        if nil != categoryList {
            self.presenter?.presentCategoryList(categoryList: categoryList!)
        }else {
            self.presenter?.showError(message: couldNotFetchCategoryListError)
        }
        
    }
    
    func createItem(with itemModel: CreateItemModel) {
        
        let item = Item()
        
        guard true == self.isItemValid(itemModel) else {
            self.presenter?.showError(message: fieldsAreNotValid)
            return
        }
        item.create(name: itemModel.itemName, isDone: false, date: date, notes: notes)
        
        if itemManager.isItemNameTaken(name: itemName) {
            self.presenter?.showItemNameExistError()
        }else if nil != parentCategoryIndex {
            if parentCategoryIndex! < categoryList!.count  && parentCategoryIndex! >= 0{
                guard let category = categoryList?[parentCategoryIndex!] else {
                    //TODO: - Handle Error Gracefully Here
                    return
                }
                itemManager.addNewItem(category: category, item: item)
            }else {
                self.presenter?.showError(message: noSuchCategory)
            }
        }
    }
    
    
}
