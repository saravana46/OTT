//
//  WebViewController.swift
//  OTT
//
//  Created by user on 28/08/23.
//

import UIKit
import WebKit

class WebViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var webView: WKWebView!
    
    var Name = ""
    var Url = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = Name
        let urlString = Url
        let url = URL(string: urlString)!
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
    }
    
    @IBAction func BackBtnAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
