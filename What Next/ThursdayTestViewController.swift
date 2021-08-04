//
//  ThursdayTestViewController.swift
//  What Next
//
//  Created by Christopher Thompson on 01/08/2021.
//

import UIKit
import AVKit

class ThursdayTestViewController: UIViewController {
    
    @IBOutlet weak var exitAnswer: UITextField!
    @IBOutlet weak var exitMark: UILabel!
    
    @IBOutlet weak var extendAnswer: UITextField!
    @IBOutlet weak var extendMark: UILabel!
    
    @IBOutlet weak var explodeAnswer: UITextField!
    @IBOutlet weak var explodeMark: UILabel!
    
    @IBOutlet weak var excursionAnswer: UITextField!
    @IBOutlet weak var excursionMark: UILabel!
    
    @IBOutlet weak var exchangeAnswer: UITextField!
    @IBOutlet weak var exchangeMark: UILabel!
    
    @IBOutlet weak var exportAnswer: UITextField!
    @IBOutlet weak var exportMark: UILabel!
    
    @IBOutlet weak var exclaimAnswer: UITextField!
    @IBOutlet weak var exclaimMark: UILabel!
    
    @IBOutlet weak var expelAnswer: UITextField!
    @IBOutlet weak var expelMark: UILabel!
    
    @IBOutlet weak var externalAnswer: UITextField!
    @IBOutlet weak var externalMark: UILabel!
    
    @IBOutlet weak var exteriorAnswer: UITextField!
    @IBOutlet weak var exteriorMark: UILabel!
    
    @IBOutlet weak var timerLabel: UILabel!
    var countdownTimer: Timer!
    var totalTime = 600
    
    var totalScore = 0
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var feedbackLabel: UILabel!
    
    var player: AVAudioPlayer?

    override func viewDidLoad() {
        super.viewDidLoad()
        startTimer()
    }
    
    @IBAction func returnToPreviousScreen(_ sender: UIButton) {
        performSegueToReturnBack()
    }
    
    //Timer Functions
    func startTimer() {
        countdownTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
    }

    @objc func updateTime() {
        timerLabel.text = "\(timeFormatted(totalTime))"
        
        if totalTime != 0 {
            totalTime -= 1
        } else {
            endTimer()
        }
    }
    
    func endTimer() {
        countdownTimer.invalidate()
    }
    
    func timeFormatted(_ totalSeconds: Int) -> String {
        let seconds: Int = totalSeconds % 60
        let minutes: Int = (totalSeconds / 60) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }

    // Functions for checking the spelling and marking.
    func checkThursdayAnswers(){
        
        //exit
        if self.exitAnswer.text == "exit" {
            self.exitMark.text = "Correct!"
        } else {
            self.exitMark.text = "Incorrect"
        }
        exitAnswer.isUserInteractionEnabled = false
        
        //extend
        if self.extendAnswer.text == "extend" {
            self.extendMark.text = "Correct!"
        } else {
            self.extendMark.text = "Incorrect"
        }
        extendAnswer.isUserInteractionEnabled = false
        
        //explode
        if self.explodeAnswer.text == "explode" {
            self.explodeMark.text = "Correct!"
        } else {
            self.explodeMark.text = "Incorrect"
        }
        explodeAnswer.isUserInteractionEnabled = false
        
        //excursion
        if self.excursionAnswer.text == "excursion" {
            self.excursionMark.text = "Correct!"
        } else {
            self.excursionMark.text = "Incorrect"
        }
        excursionAnswer.isUserInteractionEnabled = false
        
        //exchange
        if self.exchangeAnswer.text == "exchange" {
            self.exchangeMark.text = "Correct!"
        } else {
            self.exchangeMark.text = "Incorrect"
        }
        exchangeAnswer.isUserInteractionEnabled = false
        
        //export
        if self.exportAnswer.text == "export" {
            self.exportMark.text = "Correct!"
        } else {
            self.exportMark.text = "Incorrect"
        }
        exportAnswer.isUserInteractionEnabled = false
        
        //exclaim
        if self.exclaimAnswer.text == "exclaim" {
            self.exclaimMark.text = "Correct!"
        } else {
            self.exclaimMark.text = "Incorrect"
        }
        exclaimAnswer.isUserInteractionEnabled = false
        
        //expel
        if self.expelAnswer.text == "expel" {
            self.expelMark.text = "Correct!"
        } else {
            self.expelMark.text = "Incorrect"
        }
        expelAnswer.isUserInteractionEnabled = false
        
        //external
        if self.externalAnswer.text == "external" {
            self.externalMark.text = "Correct!"
        } else {
            self.externalMark.text = "Incorrect"
        }
        externalAnswer.isUserInteractionEnabled = false
        
        //exterior
        if self.exteriorAnswer.text == "exterior" {
            self.exteriorMark.text = "Correct!"
        } else {
            self.exteriorMark.text = "Incorrect"
        }
        exteriorAnswer.isUserInteractionEnabled = false
    }
    
    // Function will check answers, tally score and input appropriate feedback.
    @IBAction func onClickSubmitResponses(_ sender: UIButton) {
        checkThursdayAnswers()
        calculateScore()
        giveFeedback()
    }
    
    //Calculate the total score and update score label with every correct answer.
    func calculateScore() {
        totalScore = 0
        if exitMark.text == "Correct!" {
            totalScore += 1
        }
        if extendMark.text == "Correct!" {
            totalScore += 1
        }
        if explodeMark.text == "Correct!" {
            totalScore += 1
        }
        if excursionMark.text == "Correct!" {
            totalScore += 1
        }
        if exchangeMark.text == "Correct!" {
            totalScore += 1
        }
        if exportMark.text == "Correct!" {
            totalScore += 1
        }
        if exclaimMark.text == "Correct!" {
            totalScore += 1
        }
        if expelMark.text == "Correct!" {
            totalScore += 1
        }
        if externalMark.text == "Correct!" {
            totalScore += 1
        }
        if exteriorMark.text == "Correct!" {
            totalScore += 1
        }
        scoreLabel.text = String(totalScore)
    }
    
    func giveFeedback() {
        if totalScore >= 0 && totalScore <= 3 {
            feedbackLabel.text = "You didn't manage to get many correct answers on this occasion. It looks like you need to gain a better understanding of the sound. Please go back to the lesson page and review further the materials there. It would also be benefitical to engage with some more activities. When you know you have a better understanding of the sound, reattempt this test. I know you can do it!"
        } else if totalScore >= 4 && totalScore <= 7 {
            feedbackLabel.text = "This was a fair attempt but I know you can do better! It would be a good idea to have another short review of the materials to ensure you have a full understanding! When you are ready return and have another go at the test! Good Luck!"
        } else if totalScore >= 8 && totalScore <= 9 {
            feedbackLabel.text = "This was a very strong attempt, well done! You obviously have a good understanding of this sound. You should have a short review of the words to ensure you understand the spellings and have another go to get 100%"
        } else {
            feedbackLabel.text = "100% Excellent! You've nailed your words and have shown a full understanding of the sound! You should be proud of your work!"
        }
    }
    
    // Functions & Actions for playing spelling sounds
    
    @IBAction func firstWordPressed(_ sender: UIButton) {
        playExit()
    }
    
    func playExit() {
        guard let url = Bundle.main.url(forResource: "exit", withExtension: "mp3") else { return }

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
    
    @IBAction func secondWordPressed(_ sender: UIButton) {
        playExtend()
    }
    
    func playExtend() {
        guard let url = Bundle.main.url(forResource: "extend", withExtension: "mp3") else { return }

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
    
    @IBAction func thirdWordPressed(_ sender: UIButton) {
        playExplode()
    }
    
    func playExplode() {
        guard let url = Bundle.main.url(forResource: "explode", withExtension: "mp3") else { return }

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
    
    @IBAction func fourthWordPressed(_ sender: UIButton) {
        playExcursion()
    }
    
    func playExcursion() {
        guard let url = Bundle.main.url(forResource: "excursion", withExtension: "mp3") else { return }

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
    
    @IBAction func fifthWordPressed(_ sender: UIButton) {
        playExchange()
    }
    
    func playExchange() {
        guard let url = Bundle.main.url(forResource: "exchange", withExtension: "mp3") else { return }

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
    
    @IBAction func sixthWordPressed(_ sender: UIButton) {
        playExport()
    }
    
    func playExport() {
        guard let url = Bundle.main.url(forResource: "export", withExtension: "mp3") else { return }

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
    
    @IBAction func seventhWordPressed(_ sender: UIButton) {
        playExclaim()
    }
    func playExclaim() {
        guard let url = Bundle.main.url(forResource: "exclaim", withExtension: "mp3") else { return }

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
    
    @IBAction func eigthWordPressed(_ sender: UIButton) {
        playExpel()
    }
    
    func playExpel() {
        guard let url = Bundle.main.url(forResource: "expel", withExtension: "mp3") else { return }

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
    
    @IBAction func ninthWordPressed(_ sender: UIButton) {
        playExternal()
    }
    
    func playExternal() {
        guard let url = Bundle.main.url(forResource: "external", withExtension: "mp3") else { return }

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
    
    @IBAction func tenthWordPressed(_ sender: UIButton) {
        playExterior()
    }
    
    func playExterior() {
        guard let url = Bundle.main.url(forResource: "exterior", withExtension: "mp3") else { return }

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
