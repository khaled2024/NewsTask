//
//  FavModel.swift
//  NewsTask
//
//  Created by KhaleD HuSsien on 02/11/2024.
//

import Foundation
protocol FavDelegate: AnyObject {
    func reloadCV()
    func emptyCV()
}
class FavModel {
    var articles: [ArticleModel] = []
    weak var delegate: FavDelegate?

    func getArticels(){
        self.articles = CoreDataManager.shared.fetchArticles()
        print("articels \(self.articles)")
        if self.articles.isEmpty == true{
            delegate?.emptyCV()
        }
        delegate?.reloadCV()
    }
}
