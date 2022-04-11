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
    var delegate: CatchNewsDataDelegate?
    func request(index: Int, searchWord: String){
        let url  = "https://newsapi.org/v2/everything?domains=yahoo.co.jp,nikkei.com,sankei.com&q=\(searchWord)&apiKey=2dadbe9531074cfe86934358180c7e24"
        // エンコード (これしないとsearchWordが日本語の時にリクエストが機能しなくなる
        let encorderUrlString:String = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!

        AF.request(encorderUrlString, method: .get, parameters: nil, encoding: JSONEncoding.default).responseJSON {
            response in
            switch response.result{
            case .success:
                do{
                    let newsData = try JSONDecoder().decode(Article.self, from: response.data!)
                    let title = newsData.articles[index].title
                    let url = newsData.articles[index].url
                    let urlToImage = newsData.articles[index].urlToImage
                    let publishedAt = newsData.articles[index].publishedAt
                    guard let title = title, let url = url,let urlToImage = urlToImage,let publishedAt = publishedAt else{
                        return
                    }
                    self.delegate?.catchNewsData(title: title, url: url, urlToImage: urlToImage, publishedAt: publishedAt)
                }
                catch{
                    print("取得失敗")
                }
            case .failure(_):
                print("switchFail")
            }
        }
    }
}
