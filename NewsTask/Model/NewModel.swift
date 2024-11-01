//
//  NewModel.swift
//  NewsTask
//
//  Created by KhaleD HuSsien on 01/11/2024.
//

import Foundation
struct NewModel: Codable {
    let status: String
    let totalResults: Double
    let articles: [Article]
}
struct Article: Codable {
    let author: String?
    let title: String?
    let description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String?
    let content: String?
}
