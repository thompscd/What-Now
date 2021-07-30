//
//  WednesdayLessonViewController.swift
//  What Next
//
//  Created by Christopher Thompson on 23/07/2021.
//

import UIKit
import AVKit
import AVFoundation

class WednesdayLessonViewController: UIViewController {
    
    var player:AVAudioPlayer?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBOutlet weak var wordCover: UIImageView!
    @IBOutlet weak var coverCover: UIImageView!
    
    @IBAction func coverPressed(_ sender: UIButton) {
        if wordCover.isHidden == true {
            wordCover.isHidden = false
            coverCover.isHidden = true
        } else {
            wordCover.isHidden = true
            coverCover.isHidden = false
        }
    }
    
    @IBAction func creationPressed(_ sender: UIButton) {
        playCreation()
    }
    
    @IBAction func radiationPressed(_ sender: UIButton) {
        playRadiation()
    }
    
    //Add and Update audio file in function.
    func playCreation() {
        guard let url = Bundle.main.url(forResource: "TestAudioFile", withExtension: "wav") else { return }

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
    func playRadiation() {
        guard let url = Bundle.main.url(forResource: "TestAudioFile", withExtension: "wav") else { return }

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
    
    @IBAction func wednesdayVideoPressed(_ sender: UIButton) {
        playWednesdayVideo()
    }
    
    //Upload and Update video for function
    private func playWednesdayVideo() {
        guard let path = Bundle.main.path(forResource: "testVideo", ofType:"mp4") else {
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
            vc?.activityPageTitle = "ation Activities!"
        }
    }
    
    @IBAction func returnToPreviousScreen(_ sender: UIButton) {
        performSegueToReturnBack()
    }
    
}
