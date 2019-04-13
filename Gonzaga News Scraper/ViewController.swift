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

class ViewController: UIViewController, WKNavigationDelegate {

    
    var webView: WKWebView!
    
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        let url = URL(string: "https://www.gonzaga.edu")!
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
        // Do any additional setup after loading the view, typically from a nib.
    }
    

}

