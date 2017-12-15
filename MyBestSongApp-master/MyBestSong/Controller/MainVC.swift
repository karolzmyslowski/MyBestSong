//
//  MainVC.swift
//  MyBestSong
//
//  Created by Karol Zmyslowski on 13.12.2017.
//  Copyright © 2017 Karol Zmyslowski. All rights reserved.
//

import UIKit

class MainVC: UIViewController, UITableViewDelegate, UITableViewDataSource, AddSongVCDelegate {
    func addSongDiDCancel(_ controller: AddVC) {
        dismiss(animated: true, completion: nil)
    }
    
    func addSong(_ controller: AddVC, didFinishAdding song: BestSong) {
        let newRowIndex = bestSongs.count
        bestSongs.append(song)
        let indexPath = IndexPath(row: newRowIndex, section: 0)
        let indexPaths = [indexPath]
        tableView.insertRows(at: indexPaths, with: .automatic)
        dismiss(animated: true, completion: nil)
    }
    
   
    
    var bestSongs:[BestSong] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        let song1 = BestSong(imageURL: "https://cdbaby.name/n/o/noresolve14.jpg", videoURL: "<iframe width=\"\(view.bounds.width-10)\" height=\"315\" src=\"https://www.youtube.com/embed/doUNZn9a9xc\" frameborder=\"0\" gesture=\"media\" allow=\"encrypted-media\" allowfullscreen></iframe>", videoTitle: "Get Me Out")
          bestSongs.append(song1)
        let song2 = BestSong(imageURL: "https://ukutabs.com/uploads/2012/10/Ghost.jpg", videoURL: "<iframe width=\"\(view.bounds.width-10)\" height=\"315\" src=\"https://www.youtube.com/embed/P8a4iiOnzsc\" frameborder=\"0\" gesture=\"media\" allow=\"encrypted-media\" allowfullscreen></iframe>", videoTitle: "Welcome Home")
        bestSongs.append(song2)
        let song3 = BestSong(imageURL: "https://i1.sndcdn.com/artworks-000018833944-vweac6-t500x500.jpg", videoURL: "<iframe width=\"\(view.bounds.width-10)\" height=\"315\" src=\"https://www.youtube.com/embed/HdnTSXUWd3E\" frameborder=\"0\" gesture=\"media\" allow=\"encrypted-media\" allowfullscreen></iframe>", videoTitle: "War of Change")
        bestSongs.append(song3)
        }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? Cell {
            let bestSong = bestSongs[indexPath.row]
            cell.updateUI(bestSong: bestSong)
            
            return cell
        } else {
        return UITableViewCell()
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bestSongs.count
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let bestSong = bestSongs[indexPath.row]
        performSegue(withIdentifier: "VideoVC", sender: bestSong)
        
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        bestSongs.remove(at: indexPath.row)
        let indexPaths = [indexPath]
        tableView.deleteRows(at: indexPaths, with: .automatic)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         if segue.identifier == "VideoVC" {
        if let desttnation = segue.destination as? VideoVC {
            if let song = sender as? BestSong{
                desttnation.bestSong = song
                }
            }
         } else if segue.identifier == "Addsong" {
            let controller = segue.destination as! AddVC
            controller.delegate = self
            }
        }
    
}
