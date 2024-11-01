//
//  MainViewModel.swift
//  NewsTask
//
//  Created by KhaleD HuSsien on 01/11/2024.
//

import Foundation
class MainViewModel {
    var articles: [Article] = []
    func getArticels(sortingFrom: String,searchText: String,completion: @escaping ()-> Void) {
        
        let urlStringWithoutSearch: String = "\(Constant.URL)top-headlines?sources=techcrunch&from=\(sortingFrom)&apiKey=\(Constant.API_KEY)"
        
        let urlStringWithSearch: String = "\(Constant.URL)top-headlines?q=\(searchText)&from=\(sortingFrom)&apiKey=\(Constant.API_KEY)"
        
        NetworkManager.shared.getData(urlString: searchText == "" ? urlStringWithoutSearch : urlStringWithSearch) { newModel, error in
          
            if let error = error{
                print("error \(error)")
            }else if let newModel{
                self.articles = newModel.articles
                completion() 
            }
        }
    }
    func getCurrentDate() -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        let currentDate = Date()
        let formattedDate = dateFormatter.string(from: currentDate)
        return formattedDate
    }
}

