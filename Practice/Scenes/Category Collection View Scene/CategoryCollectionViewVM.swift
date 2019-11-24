//
//  collectionViewVM.swift
//  Practice
//
//  Created by Berkin Sili on 15.11.2019.
//  Copyright © 2019 Berkin Sili. All rights reserved.
//

import Foundation

struct CategoryCollectionViewVM {
    struct CategoryItemsTVCVM{
        var title: String
        var isDone: Bool
        var moreItems: Int?
    }
    struct CategoryVM {
        var title: String
        var categoryItemList: [CategoryItemsTVCVM]
        var categoryIconName: String
        var categoryColorName: String
    }
    var categoryListVM: [CategoryVM]
    var pageTitle: String
}

typealias CategoryVM = CategoryCollectionViewVM.CategoryVM
typealias CategoryListItemVM = CategoryCollectionViewVM.CategoryItemsTVCVM
