//
//  MondayLessonViewController.swift
//  What Next
//
//  Created by Christopher Thompson on 20/07/2021.
//

import UIKit
import AVFoundation

class MondayLessonViewController: UIViewController {
    
    var player: AVAudioPlayer?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func caughtPressed(_ sender: UIButton) {
        
        print("Caught got pressed")
        playSound()
        
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
