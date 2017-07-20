//
//  CoreDataManager.swift
//  NewsWithCoreData
//
//  Created by Diego Fonseca Marín on 5/30/17.
//  Copyright © 2017 Diego Fonseca Marín. All rights reserved.
//

import UIKit
import CoreData

class CoreDataManager: NSObject {
    
    class func getAllCategories() -> [Category] {
        let result = Category.mr_findAll()
        if result!.count == 0 {
            return createDefaultCategories()
        }
        return result as! [Category]
    }
    
    private class func createDefaultCategories() -> [Category] {
        createCategory(name: "Economía", image: "economy")
        createCategory(name: "Sucesos", image: "incident")
        createCategory(name: "Deportes", image: "sports")
        createCategory(name: "Tecnología", image: "technology")
        saveContext()
        return getAllCategories()
    }
    
    private class func createCategory(name: String, image: String) {
        let category = Category.mr_createEntity()
        category?.name = name
        category?.image = image
    }
    
    class func addNews(category: Category, title: String, descriptionNews: String) {
        let news = News.mr_createEntity()
        news?.category = category
        news?.title = title
        news?.descriptionNews = descriptionNews
        news?.createdAt = Date()
        saveContext()
    }
    
    private class func saveContext() {
        NSManagedObjectContext.mr_default().mr_saveToPersistentStoreAndWait()
    }
}
