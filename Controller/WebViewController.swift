//
//  WebViewController.swift
//  GourmetSearch
//
//  Created by Nagae on 2021/07/18.
//

import UIKit
import WebKit
import PKHUD

class WebViewController: UIViewController,WKNavigationDelegate {
    
    
    @IBOutlet weak var webView: WKWebView!
    
    var shopUrlString = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView.navigationDelegate = self
        HUD.show(.progress)
        
        
        if let url = URL(string: shopUrlString){
            let request = NSURLRequest(url: url)
            self.webView.load(request as URLRequest)
            
        }else{
            print("NSURL作成失敗")
        }
        // Do any additional setup after loading the view.
    }
    
    
    //リロード完了後
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        
        
        HUD.hide()
    }
    
 
    
    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
