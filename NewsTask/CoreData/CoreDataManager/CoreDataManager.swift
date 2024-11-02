//
//  CoreDataManager.swift
//  NewsTask
//
//  Created by KhaleD HuSsien on 02/11/2024.
//

import Foundation
import CoreData
class CoreDataManager {
    static let shared = CoreDataManager(modelName: "ArticleModel")
    let persistentContainer: NSPersistentContainer
    var viewContext: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    init(modelName: String){
        persistentContainer = NSPersistentContainer(name: modelName)
    }
    
    func load(completion: (() -> Void)? = nil){
        persistentContainer.loadPersistentStores { _, error in
            if let error {
                fatalError("Failed to load persistent stores: \(error)")
            }
            completion?()
        }
    }
    func save(){
        if viewContext.hasChanges{
            do {
                try viewContext.save()
            } catch  {
                print("An error hapen when saving data \(error.localizedDescription)")
            }
        }
    }
    // MARK: - Helper Func
    func createArticle(title: String, description: String, image: String,sec: String) {
        let article = ArticleModel(context: viewContext)
        article.title = title
        article.desc = description
        article.imageURL = image
        article.sec = sec
        save()
    }
    func fetchArticles()-> [ArticleModel]{
        let request: NSFetchRequest<ArticleModel> = ArticleModel.fetchRequest()
        return (try? viewContext.fetch(request)) ?? []
    }
}
