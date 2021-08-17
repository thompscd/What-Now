//
//  FridayTestViewController.swift
//  What Next
//
//  Created by Christopher Thompson on 01/08/2021.
//

import UIKit
import AVKit

class FridayTestViewController: UIViewController {
    
    @IBOutlet weak var caughtAnswer: UITextField!
    @IBOutlet weak var caughtMark: UILabel!
    
    @IBOutlet weak var explodeAnswer: UITextField!
    @IBOutlet weak var explodeMark: UILabel!
    
    @IBOutlet weak var causeAnswer: UITextField!
    @IBOutlet weak var causeMark: UILabel!
    
    @IBOutlet weak var authorAnswer: UITextField!
    @IBOutlet weak var authorMark: UILabel!
    
    @IBOutlet weak var childrensAnswer: UITextField!
    @IBOutlet weak var childrensMark: UILabel!
    
    @IBOutlet weak var boysAnswer: UITextField!
    @IBOutlet weak var boysMark: UILabel!
    
    @IBOutlet weak var creationAnswer: UITextField!
    @IBOutlet weak var creationMark: UILabel!
    
    @IBOutlet weak var relegationAnswer: UITextField!
    @IBOutlet weak var relegationMark: UILabel!
    
    @IBOutlet weak var exportAnswer: UITextField!
    @IBOutlet weak var exportMark: UILabel!
    
    @IBOutlet weak var exchangeAnswer: UITextField!
    @IBOutlet weak var exchangeMark: UILabel!
    
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
    func checkFridayAnswers(){
        
        //caught
        if self.caughtAnswer.text == "caught" {
            self.caughtMark.text = "Correct!"
        } else {
            self.caughtMark.text = "Incorrect"
        }
        caughtAnswer.isUserInteractionEnabled = false
        
        //explode
        if self.explodeAnswer.text == "explode" {
            self.explodeMark.text = "Correct!"
        } else {
            self.explodeMark.text = "Incorrect"
        }
        explodeAnswer.isUserInteractionEnabled = false
        
        //cause
        if self.causeAnswer.text == "cause" {
            self.causeMark.text = "Correct!"
        } else {
            self.causeMark.text = "Incorrect"
        }
        causeAnswer.isUserInteractionEnabled = false
        
        //author
        if self.authorAnswer.text == "author" {
            self.authorMark.text = "Correct!"
        } else {
            self.authorMark.text = "Incorrect"
        }
        authorAnswer.isUserInteractionEnabled = false
        
        //childrens
        if self.childrensAnswer.text == "Children’s" {
            self.childrensMark.text = "Correct!"
        } else {
            self.childrensMark.text = "Incorrect"
        }
        childrensAnswer.isUserInteractionEnabled = false
        
        //boys
        if self.boysAnswer.text == "Boys’" {
            self.boysMark.text = "Correct!"
        } else {
            self.boysMark.text = "Incorrect"
        }
        boysAnswer.isUserInteractionEnabled = false
        
        //creation
        if self.creationAnswer.text == "creation" {
            self.creationMark.text = "Correct!"
        } else {
            self.creationMark.text = "Incorrect"
        }
        creationAnswer.isUserInteractionEnabled = false
        
        //relegation
        if self.relegationAnswer.text == "relegation" {
            self.relegationMark.text = "Correct!"
        } else {
            self.relegationMark.text = "Incorrect"
        }
        relegationAnswer.isUserInteractionEnabled = false
        
        //export
        if self.exportAnswer.text == "export" {
            self.exportMark.text = "Correct!"
        } else {
            self.exportMark.text = "Incorrect"
        }
        exportAnswer.isUserInteractionEnabled = false
        
        //exchange
        if self.exchangeAnswer.text == "exchange" {
            self.exchangeMark.text = "Correct!"
        } else {
            self.exchangeMark.text = "Incorrect"
        }
        exchangeAnswer.isUserInteractionEnabled = false
    }
    
    // Function will check answers, tally score and input appropriate feedback.
    @IBAction func onClickSubmitResponses(_ sender: UIButton) {
        checkFridayAnswers()
        calculateScore()
        giveFeedback()
        endTimer()
    }
    
    //Calculate the total score and update score label with every correct answer.
    func calculateScore() {
        totalScore = 0
        if caughtMark.text == "Correct!" {
            totalScore += 1
        }
        if explodeMark.text == "Correct!" {
            totalScore += 1
        }
        if causeMark.text == "Correct!" {
            totalScore += 1
        }
        if authorMark.text == "Correct!" {
            totalScore += 1
        }
        if childrensMark.text == "Correct!" {
            totalScore += 1
        }
        if boysMark.text == "Correct!" {
            totalScore += 1
        }
        if creationMark.text == "Correct!" {
            totalScore += 1
        }
        if relegationMark.text == "Correct!" {
            totalScore += 1
        }
        if exportMark.text == "Correct!" {
            totalScore += 1
        }
        if exchangeMark.text == "Correct!" {
            totalScore += 1
        }
        scoreLabel.text = String(totalScore)
    }
    
    func giveFeedback() {
        if totalScore >= 0 && totalScore <= 3 {
            feedbackLabel.text = "Two Stars and a Wish! \n \n * You tried your hardest to complete the test, Well Done! * \n \n * You have begun to understand the weekly sounds * \n \n Wish: You didn't score as well as you can. \n Please revisit the sound activities and try again"
        } else if totalScore >= 4 && totalScore <= 7 {
            feedbackLabel.text = "Two Stars and a Wish! \n \n * This was a good attempt at the test with a good score, well done! * \n \n * You have shown a solid understanding of the weekly sounds * \n \n Wish: You've missed a few answers! \n Try an activity or two again and have another go!"
        } else if totalScore >= 8 && totalScore <= 9 {
            feedbackLabel.text = "Two Stars and a Wish! \n \n * You scored very well, Great Job! * \n \n * You have a strong understanding of the weekly sounds! * \n \n Wish: Lets try for 100%. \n Look at the words you got incorrect and have another go!"
        } else {
            feedbackLabel.text = "100% Excellent! You've nailed your words and have shown a full understanding of the sound! You should be proud of your work!"
        }
    }
    
    // Functions & Actions for playing spelling sounds
    
    @IBAction func firstWordPressed(_ sender: UIButton) {
        playCaught()
    }
    
    func playCaught() {
        guard let url = Bundle.main.url(forResource: "caught", withExtension: "mp3") else { return }

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
    
    @IBAction func thirdWordPressed(_ sender: UIButton) {
        playCause()
    }
    
    func playCause() {
        guard let url = Bundle.main.url(forResource: "cause", withExtension: "mp3") else { return }

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
        playAuthor()
    }
    
    func playAuthor() {
        guard let url = Bundle.main.url(forResource: "author", withExtension: "mp3") else { return }

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
        playChildrens()
    }
    
    func playChildrens() {
        guard let url = Bundle.main.url(forResource: "childrens", withExtension: "mp3") else { return }

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
        playBoys()
    }
    
    func playBoys() {
        guard let url = Bundle.main.url(forResource: "boys", withExtension: "mp3") else { return }

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
        playCreation()
    }
    func playCreation() {
        guard let url = Bundle.main.url(forResource: "creation", withExtension: "mp3") else { return }

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
        playRelegation()
    }
    
    func playRelegation() {
        guard let url = Bundle.main.url(forResource: "relegation", withExtension: "mp3") else { return }

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
    
    @IBAction func tenthWordPressed(_ sender: UIButton) {
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
    

}
