//
//  ViewController.swift
//  MiniApp-Alamofire-NewsAPI
//
//  Created by 近藤米功 on 2022/04/01.
//

import UIKit

class ViewController: UIViewController, CatchNewsDataDelegate {
    
    var requestNewsData = RequestNewsData()
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var publishedAtLabel: UILabel!
    @IBOutlet weak var urlLabel: UILabel!
    @IBOutlet weak var urlToImageLabel: UILabel!
    @IBOutlet weak var indexSegmentedControl: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        requestNewsData.delegete = self
    }
    
    func catchNewsData(title: String, url: String, urlToImage: String, publishedAt: String) {
        titleLabel.text = title
        publishedAtLabel.text = publishedAt
        urlLabel.text = url
        urlToImageLabel.text = urlToImage
    }

    @IBAction func requestButton(_ sender: Any) {
        // TODO: オプショナルバインディング
        let searchWord = searchTextField.text ?? ""
        requestNewsData.request(index: indexSegmentedControl.selectedSegmentIndex,searchWord: searchWord)
    }
}

