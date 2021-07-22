//
//  MondayLessonViewController.swift
//  What Next
//
//  Created by Christopher Thompson on 20/07/2021.
//

import UIKit
import AVFoundation
import AVKit

class MondayLessonViewController: UIViewController {
    
    var player: AVAudioPlayer?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func caughtPressed(_ sender: UIButton) {
        
        print("Caught got pressed")
        playSound()
        
    }
    
    
    @IBAction func testVideoPressed(_ sender: UIButton) {
        playVideo()
    }
    
    
    @IBOutlet weak var coverBlock: UIImageView!
    @IBOutlet weak var imageBlock: UIImageView!
    
    @IBAction func wordCover(_ sender: UIButton) {
        if imageBlock.isHidden == true {
            imageBlock.isHidden = false
            coverBlock.isHidden = true
        } else {
            imageBlock.isHidden = true
            coverBlock.isHidden = false
        }
    }
    
    private func playVideo() {
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
    
    func playSound() {
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
}
