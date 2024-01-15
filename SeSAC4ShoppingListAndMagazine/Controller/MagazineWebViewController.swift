//
//  MagazineWebViewController.swift
//  SeSAC4ShoppingListAndMagazine
//
//  Created by Minho on 1/15/24.
//

import UIKit
import WebKit

class MagazineWebViewController: UIViewController {
    
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func configureWebView(urlString: String) {
            
        DispatchQueue.main.async {
            if let url = URL(string: urlString) {
                let request = URLRequest(url: url)
                self.webView.load(request)
            }
        }
    }
}
