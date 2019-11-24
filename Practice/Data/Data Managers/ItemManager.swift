//
//  ItemManager.swift
//  Practice
//
//  Created by Berkin Sili on 15.11.2019.
//  Copyright © 2019 Berkin Sili. All rights reserved.
//

import Foundation
import RealmSwift

class ItemManager {

    let realm = try! Realm()
    static let sharedInstance = ItemManager()

    //MARK: - Create
    public func addNewItem(category: Category, item: Item) {
        do {
            try self.realm.write {
                item.dateCreated = Date()
                category.itemList.append(item)
            }
        } catch {
            print("Error saving new item \(item.itemName), \(error)")//TODO: - Handle Error Gracefully here
        }
    }
    
    //MARK: - Read
    func getAllItems() -> Results<Item> {//TODO: - Get all items if you need somehow
        return realm.objects(Item.self)
    }
    
    func filterItems(with name: String) -> Results<Item> { //TODO: - Return the item with name
        let predicate = NSPredicate(format: "itemName = %@", name)
        return realm.objects(Item.self).filter(predicate)

    }
    
    func getItem(by id: String) -> Item? {
        return realm.object(ofType: Item.self, forPrimaryKey: id) ?? nil
    }
    
    func isItemNameTaken(name: String) -> Bool {
        let predicate = NSPredicate(format: "itemName = %@", name)
        let itemsWithName = realm.objects(Item.self).filter(predicate)
        
        return 0 != itemsWithName.count
    }
    //MARK: - Update
    func updateItem(item: Item) {
        do {
            try realm.write {
            realm.add(item, update: .modified)
            }
        } catch {
            print("Error updating category \(item.itemName), \(error)")//TODO: - Handle Error Gracefully here
        }
    }
    
    //MARK: - Delete
    public func deleteItemAt(item: Item) {
            do {
                try realm.write {
                    realm.delete(item)
                }
            } catch {
                print("Error deleting Item \(item.itemName), \(error)")//TODO: - Handle Error Gracefully here
            }
    }

}
