//
//  SelectVC.swift
//  Wirtualna Uczelnia
//
//  Created by Karol Zmyslowski on 31.01.2018.
//  Copyright © 2018 Karol Zmyslowski. All rights reserved.
//

import UIKit
import WebKit

class SelectVC: UIViewController {
    
    var webView = WKWebView()
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.frame = CGRect(x: 0, y: 300, width: 300, height: 300)
        view.addSubview(webView)
        // Do any additional setup after loading the view.
    }
    @IBAction func pierwszy(_ sender: Any) {
        webView.evaluateJavaScript("document.getElementById('ctl00_ctl00_ContentPlaceHolder_RightContentPlaceHolder_rbKierunki_0').click();", completionHandler: nil)
    }
    
    @IBAction func secend(_ sender: Any) {
        webView.evaluateJavaScript("document.getElementById('ctl00_ctl00_ContentPlaceHolder_RightContentPlaceHolder_rbKierunki_1').click();", completionHandler: nil)
        
    }
    @IBAction func selectstSpecialization(_ sender: UIButton) {
        webView.evaluateJavaScript("document.getElementById('ctl00_ctl00_ContentPlaceHolder_RightContentPlaceHolder_Button1').click();", completionHandler: nil)
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1), execute: {
            let url = URL(string: "https://dziekanat.agh.edu.pl/OcenyP.aspx")
            let request = URLRequest(url: url!)
            self.webView.load(request)
            
        })
        performSegue(withIdentifier: "selectDone", sender: self.webView)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "selectDone"{
            let viewController = segue.destination as! MarkVC
            viewController.webView = self.webView
        }
    }
}
