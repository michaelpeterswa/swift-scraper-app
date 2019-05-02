//
//  ViewController.swift
//  Gonzaga News Scraper
//
//  Created by Peters, Michael E. on 4/9/19.
//  Copyright © 2019 northw.st. All rights reserved.
//

import UIKit
import WebKit

import Kanna
import Alamofire

class ViewController: UIViewController {

    weak var tableView: UITableView!
    
    var html: String? = nil
    
//    var items: [String] = [
//        "👽", "🐱", "🐔", "🐶", "🦊", "🐵", "🐼", "🐷", "💩", "🐰",
//        "🤖", "🦄", "🐻", "🐲", "🦁", "💀", "🐨", "🐯", "👻", "🦖",
//        ]
    //var articles: [String] = ["Test", "Test2"]
    
    override func loadView() {
        super.loadView()
        
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(tableView)
        NSLayoutConstraint.activate([
            self.view.safeAreaLayoutGuide.topAnchor.constraint(equalTo: tableView.topAnchor),
            self.view.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: tableView.bottomAnchor),
            self.view.leadingAnchor.constraint(equalTo: tableView.leadingAnchor),
            self.view.trailingAnchor.constraint(equalTo: tableView.trailingAnchor),
            ])
        self.tableView = tableView
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        self.tableView.dataSource = self
        self.scrapeGonzagaNews()
    }
    
    func scrapeGonzagaNews() -> Void {
        Alamofire.request("https://www.gonzaga.edu/news-events/stories/").responseString { response in
            print("Success: \(response.result.isSuccess)")
            self.html = response.result.value
            //self.parseHTML(response.result.value!)
            
        }
    }
//    func scrapeGonzagaNews() -> Void {
//        Alamofire.request("https://www.gonzaga.edu/news-events/stories/").responseString(queue: nil, encoding: NSUTF8StringEncoding) { response in
//            if let html = response.result.value,
//                let doc = try? HTML(html: html, encoding: .utf8) {
//                for headline in doc.css(".block-caption h3") {
//                    print(String(headline.text!.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)))
//                    //self.articles.append(String(headline.text!.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)))
//                    self.articles.append("test3")
//
//                }
////                for headline in doc.css(".news-heading") {
////                    print(headline.text!.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines))
////                }
//            }
//        }
//        self.tableView.reloadData()
//    }
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //print(self.articles.count)
        return self.articles.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        let item = self.articles[indexPath.item]
        cell.textLabel?.text = item
        return cell
    }
    
}

//
