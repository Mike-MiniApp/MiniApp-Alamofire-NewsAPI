//
//  RequestNewsData.swift
//  MiniApp-Alamofire-NewsAPI
//
//  Created by 近藤米功 on 2022/04/01.
//

import Foundation
import Alamofire
protocol CatchNewsDataDelegate{
    func catchNewsData(title: String,url: String,urlToImage: String,publishedAt: String)
}

class RequestNewsData{
    var delegete: CatchNewsDataDelegate?
    func request(index: Int,searchWord: String){
        // let urlString = "https://newsapi.org/v2/top-headlines?country=jp&category=\(searchWord)&apiKey=2dadbe9531074cfe86934358180c7e24"
        let urlString = "https://newsapi.org/v2/top-headlines?country=jp&apiKey=2dadbe9531074cfe86934358180c7e24"
        // let urlString = "https://newsapi.org/v2/everything?q=apple&from=2022-04-04&to=2022-04-04&sortBy=popularity&apiKey=2dadbe9531074cfe86934358180c7e24"
        print("index:",index)
        AF.request(urlString).responseJSON { response in
            guard let data = response.data else{
                print("nodata")
                return
            }
            do{
                let newsData = try JSONDecoder().decode(Articles.self, from: data) // カテゴリーの指定によってエラーが起きてcatchしてしまう。
                print("nesData",newsData)
                let title = newsData.articles[index].title
                let url = newsData.articles[index].url
                let urlToImage = newsData.articles[index].urlToImage
                let publishedAt = newsData.articles[index].publishedAt
                print(title)
                print(publishedAt)
                self.delegete?.catchNewsData(title: title, url: url, urlToImage: urlToImage, publishedAt: publishedAt)
            }catch{
                print("取得失敗")
            }
        }
    }
}
