//
//  AddVC.swift
//  MyBestSong
//
//  Created by Karol Zmyslowski on 15.12.2017.
//  Copyright © 2017 Karol Zmyslowski. All rights reserved.
//

import UIKit

protocol AddSongVCDelegate: class {
    func addSongDiDCancel(_ controller: AddVC)
    func addSong(_ controller: AddVC, didFinishAdding song: BestSong)
}


class AddVC: UIViewController {

   
    @IBOutlet weak var addImageURL : UITextField!
    @IBOutlet weak var addVideoURL: UITextField!
    @IBOutlet weak var addTitle: UITextField!
    
    weak var delegate: AddSongVCDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func cancel() {
        delegate?.addSongDiDCancel(self)
    }
    
    @IBAction func done() {
        var addImage = addImageURL.text!
        if addImage == ""{
            addImage = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ35RxCc87MaBcxQCt-hZRcZMXgH1Pwovnml7PjOZ3xN-p_pR-S"
        }
        var addVideo = addVideoURL.text!
        if addVideo == "" {
            addVideo = "Error. Try again copy link"
        } else {
            addVideo = "<iframe width=\"\(Int(view.bounds.width-10))\" height=\"315\" src=\"https://www.youtube.com/embed/\(addVideoURL.text!)\" frameborder=\"0\" gesture=\"media\" allow=\"encrypted-media\" allowfullscreen></iframe>"
            
        }
        let song = BestSong(imageURL: addImage, videoURL: addVideo, videoTitle: addTitle.text!)
        delegate?.addSong(self, didFinishAdding: song)
        print(addVideo)
    }
}
