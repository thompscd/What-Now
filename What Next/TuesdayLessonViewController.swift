//
//  TuesdayLessonViewController.swift
//  What Next
//
//  Created by Christopher Thompson on 22/07/2021.
//

import UIKit
import AVKit
import AVFoundation

class TuesdayLessonViewController: UIViewController {
    
    var player:AVAudioPlayer?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBOutlet weak var wordCover: UIImageView!
    @IBOutlet weak var coverCover: UIImageView!
    
    @IBAction func wordCover(_ sender: UIButton) {
        if wordCover.isHidden == true {
            wordCover.isHidden = false
            coverCover.isHidden = true
        } else {
            wordCover.isHidden = true
            coverCover.isHidden = false
        }
    }
    
    @IBAction func girlsPressed(_ sender: UIButton) {
        playGirls()
    }
    
    @IBAction func mensPressed(_ sender: UIButton) {
        playMens()
    }
    
    //Add and Update audio file in function.
    func playGirls() {
        guard let url = Bundle.main.url(forResource: "girls", withExtension: "mp3") else { return }

        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)

            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)

            guard let player = player else { return }

            player.play()

        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    //Add and Update audio file in function.
    func playMens() {
        guard let url = Bundle.main.url(forResource: "mens", withExtension: "mp3") else { return }

        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)

            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)

            guard let player = player else { return }

            player.play()

        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    @IBAction func tuesdayVideoPressed(_ sender: UIButton) {
        playTuesdayVideo()
    }
    
    //Upload and Update video for function
    private func playTuesdayVideo() {
        guard let path = Bundle.main.path(forResource: "TuesdayVideo", ofType:"mp4") else {
            debugPrint("testVideo.mp4 not found")
            return
        }
        let player = AVPlayer(url: URL(fileURLWithPath: path))
        let playerController = AVPlayerViewController()
        playerController.player = player
        present(playerController, animated: true) {
            player.play()
        }
    }
    
    //transfering appropriate title to next view controller
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.destination is ActivitySelectionViewController {
            let vc = segue.destination as? ActivitySelectionViewController
            vc?.activityPageTitle = "Plural Possessive Apostrophes Activities!"
        }
    }
    
    @IBAction func returnToPreviousScreen(_ sender: UIButton) {
        performSegueToReturnBack()
    }
    
    
}
