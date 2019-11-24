//
//  Category.swift
//  Practice
//
//  Created by Berkin Sili on 15.11.2019.
//  Copyright © 2019 Berkin Sili. All rights reserved.
//

import Foundation
import RealmSwift

class Category: Object {
    @objc dynamic var categoryName: String = ""
    @objc dynamic var categoryColor: String = ""
    @objc dynamic var categoryId = UUID().uuidString

    override static func primaryKey() -> String? {
        return "id"
    }
    //TODO: - Add System Icon
    let itemList = List<Item>()
    
    public func create(name: String){
        self.categoryName = name
        let categoryUIColor: UIColor = .random//TODO: - Change here, add also system icon
        self.categoryColor = categoryUIColor.toHexString()
    }
    
    public func getCompletedItemCount() -> Int {
        var completedCount = 0
        for item in itemList{
            completedCount += item.isDone ? 1 : 0
        }
        return completedCount
    }
    
    public func getPlannedItems() -> List<Item>? {
        let plannedItemList = List<Item>()
        for item in itemList {
            guard let _ = item.date else {
                return nil
                //TODO: - Handle Error Gracefully here
            }
            plannedItemList.append(item)
        }
        return plannedItemList
    }    
}
