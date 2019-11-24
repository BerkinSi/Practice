//
//  CreateItemModels.swift
//  Practice
//
//  Created by Berkin Sili on 24.11.2019.
//  Copyright © 2019 Berkin Sili. All rights reserved.
//

import Foundation

struct CreateItemModel {
    var parentCategoryIndex = -1
    var itemName: String = ""
    var dueDate: String = ""
    var notes: String = ""
}

struct CreateItemVM {
    var categoryNameList: [String]
    var pageTitle: String
    
    var parentCategoryLabel: String?
    var itemNameLabel: String?
    var dueDateLabel: String?
    var notesLabel: String?
    var doneButton: String?
}
