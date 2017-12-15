//
//  VideoVC.swift
//  MyBestSong
//
//  Created by Karol Zmyslowski on 13.12.2017.
//  Copyright © 2017 Karol Zmyslowski. All rights reserved.
//

import UIKit

class VideoVC: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var TitleLibel: UILabel!
    
    private var _bestSong: BestSong!
    
    var bestSong: BestSong{
        get {
            return _bestSong
        } set {
            _bestSong = newValue
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        TitleLibel.text = bestSong.videoTitle
        webView.loadHTMLString(bestSong.videoURL, baseURL: nil)
    }
    @IBAction func BackButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}
