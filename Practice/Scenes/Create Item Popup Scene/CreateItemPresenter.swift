//
//  CreateItemPresenter.swift
//  Practice
//
//  Created by Berkin Sili on 23.11.2019.
//  Copyright © 2019 Berkin Sili. All rights reserved.
//

import Foundation
import RealmSwift

class CreateItemPresenter {
    var viewController: CreateItemDisplayLogic?
    
    //MARK: - Constants
    private let createItemTitle = "Create New Todo Item"
    private let parentCategoryLabel = "Parent Category Name:"
    private let itemNameLabel = "Item Name:"
    private let dueDateLabel = "Due Date:"
    private let notesLabel = "Notes:"
    private let doneButton = "Add Item!"
    
    private let itemNameExistError = "There is already an Item with the same name. Please pick a different name"
    
    //MARK: - Variables
    var categoryNameList: [String] = []
}

extension CreateItemPresenter: CreateItemPresentationLogic {
    func presentVC(categoryList: Results<Category>) {
        
        categoryList.forEach { (category) in
            self.categoryNameList.append(category.categoryName)
        }
        var vm = CreateItemVM(categoryNameList: categoryNameList, pageTitle: createItemTitle)
        vm.parentCategoryLabel = parentCategoryLabel
        vm.itemNameLabel = itemNameLabel
        vm.dueDateLabel = dueDateLabel
        vm.notesLabel = notesLabel
        vm.doneButton = doneButton
        
        self.viewController?.setupUI(vm: vm)
    }
    
    
    func showItemNameExistError() {
        self.viewController?.displayNameError()
    }
    
    func showError(message: String) {
        self.viewController?.displayError(message: message)
    }
    
    func showSucces(message: String) {
        self.viewController?.displaySuccess(message: message)
    }
    
    func presentCategoryList(categoryList: Results<Category>) {
        categoryList.forEach({ (category) in
            categoryNameList.append(category.categoryName)
        })
        viewController?.displayCategoryList(categoryNames: categoryNameList)
    }
}
