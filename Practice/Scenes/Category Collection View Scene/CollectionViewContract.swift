//
//  tableViewContract.swift
//  Practice
//
//  Created by Berkin Sili on 15.11.2019.
//  Copyright © 2019 Berkin Sili. All rights reserved.
//

import Foundation
import RealmSwift

protocol CategoryCollectionViewBusinessLogic: class {
    func vcInitialized()
    func fetchData()
    func itemSelected(at index: Int)
    func itemDeleted(at index: Int)
    func filterItems(by title: String)
    func filterItems(with categoryId: String)//TODO: - Change this to category type
    func markItemAsFinished(at index: Int)
    func markItemAsUnfinished(at index: Int)
    func goToNewItemPage()
}

protocol CategoryCollectionViewPresentationLogic: class {
    func presentVC()
    func presentList(categories: Results<Category>)
    func goToItemDetail(with id: String)
    func removeItem(at index: Int)
    func goToNewItemPage()
}

protocol CategoryCollectionViewDisplayLogic {
    func signContract()
    func populateCollectionView(categoryList: [CategoryVM])
    func routeToItemDetail(with id: String)
    func removeItem(at index: Int)
}
