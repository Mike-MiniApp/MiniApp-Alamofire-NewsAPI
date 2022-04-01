//
//  NewsData.swift
//  MiniApp-Alamofire-NewsAPI
//
//  Created by 近藤米功 on 2022/04/01.
//

import Foundation
struct Articles: Codable{
    let articles: [NewsData]
}
struct NewsData: Codable{
    let title: String
    let url: String
    let urlToImage: String
    let publishedAt: String
}
