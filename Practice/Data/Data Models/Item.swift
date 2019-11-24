//
//  Item.swift
//  Practice
//
//  Created by Berkin Sili on 15.11.2019.
//  Copyright © 2019 Berkin Sili. All rights reserved.
//

import Foundation
import RealmSwift

class Item: Object {
    @objc dynamic var itemName: String = ""
    @objc dynamic var isDone: Bool = false
    @objc dynamic var dateCreated: Date?
    @objc dynamic var date: Date?
    @objc dynamic var notes: String?
    var parentCategory = LinkingObjects(fromType: Category.self, property: "itemList")
    @objc dynamic var id = UUID().uuidString

    override static func primaryKey() -> String? {
        return "id"
    }
    
    public func create(name: String, isDone: Bool, date: Date?, notes: String?) {
        self.itemName = name
        self.isDone = isDone
        self.dateCreated = Date()
        self.date = date
        self.notes = notes
    }

}
