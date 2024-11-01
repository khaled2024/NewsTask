//
//  NetworkManager.swift
//  NewsTask
//
//  Created by KhaleD HuSsien on 01/11/2024.
//

import UIKit

class NetworkManager {
    static let shared: NetworkManager = NetworkManager()
    private init() {}
    
    // MARK: - Functions
    func getData(urlString: String, completion: @escaping (NewModel?,String?)-> Void){
        guard let url = URL(string: urlString) else { return }
        print(urlString)
        URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            if let data = data {
                let articles = try? JSONDecoder().decode(NewModel.self, from: data)
                if let articles {
                    completion(articles, nil)
                }
            }else{
                completion(nil, error?.localizedDescription ?? "")
            }
        }
        .resume()
    }
}
