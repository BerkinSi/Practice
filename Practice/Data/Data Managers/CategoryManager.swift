//
//  CategoryManager.swift
//  Practice
//
//  Created by Berkin Sili on 15.11.2019.
//  Copyright © 2019 Berkin Sili. All rights reserved.
//

import Foundation
import RealmSwift

class CategoryManager {
    
    let realm = try! Realm()
    static let sharedInstance = CategoryManager()
    
    private init() {
    }
    
    //MARK: - Create
    func addCategory(category: Category) {
        do {
            try realm.write {
                realm.add(category)
            }
        } catch {
            print("Error saving category \(error)")//TODO: - Handle Error Gracefully here
        }
    }
    //MARK: - Read
    func getCategoryList() -> Results<Category> {
        return realm.objects(Category.self)
    }
    
    func getCategoryItemList(for categoryId: Int) -> Results<Item> {
        let predicate = NSPredicate(format: "id = %@", categoryId)
        return realm.objects(Item.self).filter(predicate)
    }
    
    func filterCategories(with name: String) -> Results<Category> { //TODO: - Return the item with name
        let predicate = NSPredicate(format: "categoryName = %@", name)
        return realm.objects(Category.self).filter(predicate)
    }
    
    func getCategory(by id: String) -> Category? {
        return realm.object(ofType: Category.self, forPrimaryKey: id) ?? nil
    }
    //MARK: - Update
    func updateCategory(category: Category) {
        do {
            try realm.write {
            realm.add(category, update: .modified)
            }
        } catch {
            print("Error updating category \(category.categoryName), \(error)")//TODO: - Handle Error Gracefully here
        }
    }
    //MARK: - Delete
    func removeCategory(category: Category) {
        do {
            try self.realm.write {
                self.realm.delete(category)
            }
        } catch {
            print("Error deleting category \(category.categoryName), \(error)")//TODO: - Handle Error Gracefully here
        }
    }
}
