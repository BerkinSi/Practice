//
//  tableViewPresenter.swift
//  Practice
//
//  Created by Berkin Sili on 15.11.2019.
//  Copyright © 2019 Berkin Sili. All rights reserved.
//

import Foundation
import RealmSwift

class CategoryCollectionViewPresenter {
    
    var viewController: CategoryCollectionViewDisplayLogic?
}

extension CategoryCollectionViewPresenter: CategoryCollectionViewPresentationLogic {
    func presentList(categories: Results<Category>) {
        let categoryVMList = createCategoryVMArray(for: categories)
        self.viewController?.populateCollectionView(categoryList: categoryVMList)
    }
    
    func goToItemDetail(with id: String) {
        self.viewController?.routeToItemDetail(with: id)
        //TODO: - Might add additional logic later
    }
    
    func removeItem(at index: Int) {
        self.viewController?.removeItem(at: index)
    }
    
    func goToNewItemPage() {
        //
    }
    
    //MARK: - Private functions
    private func createItemVM(from item: Item) -> CategoryListItemVM {
        return CategoryListItemVM.init(title: item.itemName, isDone: item.isDone)
    }
    
    private func createItemVMArray(for category: Category) -> [CategoryListItemVM] {
        let itemList = category.itemList
        var itemVMList: [CategoryListItemVM] = []
        itemList.forEach { (item) in
            itemVMList.append(createItemVM(from: item))
        }
        return itemVMList
    }
    
    private func createCategoryVM(from category: Category) -> CategoryVM {
        let itemArrayVM = createItemVMArray(for: category)
        return CategoryVM.init(title: category.categoryName, categoryItemList: itemArrayVM, categoryIconName: "", categoryColorName: "") // TODO: - Add system icon name and color
    }
    
    private func createCategoryVMArray(for categoryList: Results<Category>) -> [CategoryVM] {
        var categoryVMList: [CategoryVM] = []
        categoryList.forEach { (category) in
            categoryVMList.append(createCategoryVM(from: category))
        }
        
        return categoryVMList
    }

}
