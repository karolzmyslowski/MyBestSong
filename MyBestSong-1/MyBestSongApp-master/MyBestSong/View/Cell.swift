//
//  Cell.swift
//  MyBestSong
//
//  Created by Karol Zmyslowski on 13.12.2017.
//  Copyright © 2017 Karol Zmyslowski. All rights reserved.
//

import UIKit

class Cell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBOutlet weak var videoPreviewImage: UIImageView!
    @IBOutlet weak var videoTitle: UILabel!
    
    func updateUI(bestSong: BestSong){
        videoTitle.text = bestSong.videoTitle
        let url = URL(string: bestSong.imageURL)!
        DispatchQueue.global().async {
            do {
                let data = try Data(contentsOf: url)
                DispatchQueue.global().sync {
                    self.videoPreviewImage.image = UIImage(data: data)
                }
            }catch{
            }
        }
    }
}
