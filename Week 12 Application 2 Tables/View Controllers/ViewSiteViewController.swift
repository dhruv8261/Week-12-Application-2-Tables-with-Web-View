//
//  ViewSiteViewController.swift
//  Week 12 Application 2 Tables
//
//  Created by Xcode User on 2018-11-27.
//  Copyright © 2018 Sheridancollege. All rights reserved.
//

import UIKit
import WebKit

class ViewSiteViewController: UIViewController, WKNavigationDelegate {

    @IBOutlet var webView : WKWebView!
    @IBOutlet var activity : UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let mainDelegate = UIApplication.shared.delegate as! AppDelegate
        let urlAddress = URL(string: mainDelegate.selectedURL)
        let url = URLRequest(url: urlAddress!)
        webView.load(url)
        webView.navigationDelegate = self
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        activity.isHidden = false
        activity.startAnimating()
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        activity.isHidden = true
        activity.stopAnimating()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
