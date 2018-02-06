//
//  ViewController.swift
//  Wirtualna Uczelnia
//
//  Created by Karol Zmyslowski on 30.01.2018.
//  Copyright © 2018 Karol Zmyslowski. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    @IBOutlet weak var idTF :UITextField!
    @IBOutlet weak var password: UITextField!

    
    let webView = WKWebView()
    
    var counter = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        password.isSecureTextEntry = true
        let url = URL(string: "https://dziekanat.agh.edu.pl")
        let request = URLRequest(url: url!)
        webView.frame = CGRect(x: 0, y: 300, width: 300, height: 300)
        webView.load(request)
       
        view.addSubview(webView)
    }
    
    @IBAction func unSingInTapper() {
        switch counter {
        case 0:
            webView.evaluateJavaScript("document.getElementById('ctl00_ctl00_ContentPlaceHolder_MiddleContentPlaceHolder_txtIdent').value='\(self.idTF.text!)'", completionHandler: nil)
        webView.evaluateJavaScript("document.getElementById('ctl00_ctl00_ContentPlaceHolder_MiddleContentPlaceHolder_txtHaslo').value='\(self.password.text!)'", completionHandler: nil)
        case 1:
            
        webView.evaluateJavaScript("document.getElementById('ctl00_ctl00_ContentPlaceHolder_MiddleContentPlaceHolder_butLoguj').click();", completionHandler: nil)
            break
        case 2:
            if webView.url == URL(string: "https://dziekanat.agh.edu.pl/KierunkiStudiow.aspx"){
                performSegue(withIdentifier: "select", sender: webView)
            }
            if webView.url == URL(string: "https://dziekanat.agh.edu.pl/Ogloszenia.aspx"){
                performSegue(withIdentifier: "show", sender: webView)
            }
        default: break
        
        }
        counter += 1
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "select"{
            let viewController = segue.destination as! SelectVC
            viewController.webView = self.webView
        }
        if segue.identifier == "show"{
            let viewController = segue.destination as! MarkVC
            viewController.webView = self.webView
        }
    }
}

