//
//  ArticleModel+CoreDataProperties.swift
//  NewsTask
//
//  Created by KhaleD HuSsien on 02/11/2024.
//
//

import Foundation
import CoreData


extension ArticleModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ArticleModel> {
        return NSFetchRequest<ArticleModel>(entityName: "ArticleModel")
    }

    @NSManaged public var title: String!
    @NSManaged public var desc: String!
    @NSManaged public var sec: String!
    @NSManaged public var imageURL: String!
    

}

extension ArticleModel : Identifiable {

}
