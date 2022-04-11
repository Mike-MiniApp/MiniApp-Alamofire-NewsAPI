//
//  NewsData.swift
//  MiniApp-Alamofire-NewsAPI
//
//  Created by 近藤米功 on 2022/04/01.
//

import Foundation
struct Article: Codable {
    var articles: [ArticleInfo]
}
struct ArticleInfo: Codable {
    let publishedAt: String?
    let title: String?
    let url: String?
    let urlToImage: String?
}

