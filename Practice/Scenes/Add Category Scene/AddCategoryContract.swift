//
//  addCategoryContract.swift
//  Practice
//
//  Created by Berkin Sili on 23.11.2019.
//  Copyright © 2019 Berkin Sili. All rights reserved.
//

import Foundation
import Realm

protocol AddCategoryBusinessLogic {
    func vcInitialized()
    func createCategory(category: Category)
}

protocol AddCategoryPresentationLogic {
    func presentVC()
//    func presentList(categories: Results<Category>)
}

protocol AddCategoryDisplayLogic {
    func setupUI()
    func signContract()
    func removeItem(at index: Int)
}
