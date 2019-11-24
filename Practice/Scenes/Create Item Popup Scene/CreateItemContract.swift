//
//  CreateItemContract.swift
//  Practice
//
//  Created by Berkin Sili on 23.11.2019.
//  Copyright © 2019 Berkin Sili. All rights reserved.
//

import Foundation
import RealmSwift

protocol CreateItemBusinessLogic: class {
    func vcInitialized()
    func getCategoryList()
    func createItem(with itemModel: CreateItemModel)
}

protocol CreateItemPresentationLogic: class {
    func presentVC(categoryList: Results<Category>)
    func showItemNameExistError()
    func showError(message: String)
    func showSucces(message: String)
    func presentCategoryList(categoryList: Results<Category>)
}

protocol CreateItemDisplayLogic {
    func signContract()
    func setupUI(vm: CreateItemVM)
    func displayCategoryList(categoryNames: [String])
    func displayError(message: String)
    func displayNameError(message: String)
    func displaySuccess(message: String)
}


