//
//  WebViewVC.swift
//  Entities
//
//  Created by Muddika, Ramesh yadav on 26/09/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import UIKit
import WebKit


class WebViewVC: UIViewController, WKUIDelegate, WKNavigationDelegate {
    
    var urlString: String?
    var navTitle: String?
    var moreFAQs: String?
    var webView: WKWebView!
    var isLoaded:Bool?
    override func loadView() {
        
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        webView.navigationDelegate = self
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        isLoaded =  false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        

        if let title = self.navTitle {
            self.showNavBarWith(title: title)
        }else{
            self.showNavBarWith(title: "Web")

        }

        
        
        if (!isLoaded!)
        {
            if let request = createRequest() {
                
                let userAgent = UIWebView().stringByEvaluatingJavaScript(from: "navigator.userAgent")! + " Safari/1"
                webView.customUserAgent = userAgent
                webView.load(request)
            }
        }
    }
    
    private func createRequest() -> URLRequest? {
        
        guard   let urlString = urlString,
            let url = URL(string: urlString) else {
                
                return nil
        }
        
        return URLRequest(url: url)
    }
    
    func webView(_ webView: WKWebView, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
        
        guard let serverTrust = challenge.protectionSpace.serverTrust else { return }
        
        let cred = URLCredential(trust: serverTrust)
        completionHandler(.useCredential, cred)
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        isLoaded = false
        
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
        isLoaded = true
    }
    
}
