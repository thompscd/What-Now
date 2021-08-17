//
//  MondayTestViewController.swift
//  What Next
//
//  Created by Christopher Thompson on 31/07/2021.
//

import UIKit
import AVKit

class MondayTestViewController: UIViewController {
    
    @IBOutlet weak var caughtAnswer: UITextField!
    @IBOutlet weak var caughtMark: UILabel!
    
    @IBOutlet weak var naughtyAnswer: UITextField!
    @IBOutlet weak var naughtyMark: UILabel!
    
    @IBOutlet weak var taughtAnswer: UITextField!
    @IBOutlet weak var taughtMark: UILabel!
    
    @IBOutlet weak var daughterAnswer: UITextField!
    @IBOutlet weak var daughterMark: UILabel!
    
    @IBOutlet weak var autumnAnswer: UITextField!
    @IBOutlet weak var autumnMark: UILabel!
    
    @IBOutlet weak var clauseAnswer: UITextField!
    @IBOutlet weak var clauseMark: UILabel!
    
    @IBOutlet weak var causeAnswer: UITextField!
    @IBOutlet weak var causeMark: UILabel!
    
    @IBOutlet weak var astronautAnswer: UITextField!
    @IBOutlet weak var astronautMark: UILabel!
    
    @IBOutlet weak var applaudAnswer: UITextField!
    @IBOutlet weak var applaudMark: UILabel!
    
    @IBOutlet weak var authorAnswer: UITextField!
    @IBOutlet weak var authorMark: UILabel!
    
    
    @IBOutlet weak var timerLabel: UILabel!
    var countdownTimer: Timer!
    var totalTime = 600
    
    var totalScore = 0
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var feedbackLabel: UILabel!
    
    var player: AVAudioPlayer?
    
    // Test comment for GitHub
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startTimer()

        // Do any additional setup after loading the view.
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
    func checkMondayAnswers(){
        
        //caught
        if self.caughtAnswer.text == "caught" {
            self.caughtMark.text = "Correct!"
        } else {
            self.caughtMark.text = "Incorrect"
        }
        caughtAnswer.isUserInteractionEnabled = false
        
        //naughty
        if self.naughtyAnswer.text == "naughty" {
            self.naughtyMark.text = "Correct!"
        } else {
            self.naughtyMark.text = "Incorrect"
        }
        naughtyAnswer.isUserInteractionEnabled = false
        
        //taught
        if self.taughtAnswer.text == "taught" {
            self.taughtMark.text = "Correct!"
        } else {
            self.taughtMark.text = "Incorrect"
        }
        taughtAnswer.isUserInteractionEnabled = false
        
        //daughter
        if self.daughterAnswer.text == "daughter" {
            self.daughterMark.text = "Correct!"
        } else {
            self.daughterMark.text = "Incorrect"
        }
        daughterAnswer.isUserInteractionEnabled = false
        
        //autumn
        if self.autumnAnswer.text == "autumn" {
            self.autumnMark.text = "Correct!"
        } else {
            self.autumnMark.text = "Incorrect"
        }
        autumnAnswer.isUserInteractionEnabled = false
        
        //clause
        if self.clauseAnswer.text == "clause" {
            self.clauseMark.text = "Correct!"
        } else {
            self.clauseMark.text = "Incorrect"
        }
        clauseAnswer.isUserInteractionEnabled = false
        
        //cause
        if self.causeAnswer.text == "cause" {
            self.causeMark.text = "Correct!"
        } else {
            self.causeMark.text = "Incorrect"
        }
        causeAnswer.isUserInteractionEnabled = false
        
        //astronaut
        if self.astronautAnswer.text == "astronaut" {
            self.astronautMark.text = "Correct!"
        } else {
            self.astronautMark.text = "Incorrect"
        }
        astronautAnswer.isUserInteractionEnabled = false
        
        //applaud
        if self.applaudAnswer.text == "applaud" {
            self.applaudMark.text = "Correct!"
        } else {
            self.applaudMark.text = "Incorrect"
        }
        applaudAnswer.isUserInteractionEnabled = false
        
        //author
        if self.authorAnswer.text == "author" {
            self.authorMark.text = "Correct!"
        } else {
            self.authorMark.text = "Incorrect"
        }
        authorAnswer.isUserInteractionEnabled = false
    }
    
    // Function will check answers, tally score and input appropriate feedback.
    @IBAction func onClickSubmitResponses(_ sender: UIButton) {
        checkMondayAnswers()
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
        if naughtyMark.text == "Correct!" {
            totalScore += 1
        }
        if taughtMark.text == "Correct!" {
            totalScore += 1
        }
        if daughterMark.text == "Correct!" {
            totalScore += 1
        }
        if autumnMark.text == "Correct!" {
            totalScore += 1
        }
        if clauseMark.text == "Correct!" {
            totalScore += 1
        }
        if causeMark.text == "Correct!" {
            totalScore += 1
        }
        if astronautMark.text == "Correct!" {
            totalScore += 1
        }
        if applaudMark.text == "Correct!" {
            totalScore += 1
        }
        if authorMark.text == "Correct!" {
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
        playNaughty()
    }
    
    func playNaughty() {
        guard let url = Bundle.main.url(forResource: "naughty", withExtension: "mp3") else { return }

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
        playTaught()
    }
    
    func playTaught() {
        guard let url = Bundle.main.url(forResource: "taught", withExtension: "mp3") else { return }

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
        playDaughter()
    }
    
    func playDaughter() {
        guard let url = Bundle.main.url(forResource: "daughter", withExtension: "mp3") else { return }

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
        playAutumn()
    }
    
    func playAutumn() {
        guard let url = Bundle.main.url(forResource: "autumn", withExtension: "mp3") else { return }

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
        playClause()
    }
    
    func playClause() {
        guard let url = Bundle.main.url(forResource: "clause", withExtension: "mp3") else { return }

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
    
    @IBAction func eigthWordPressed(_ sender: UIButton) {
        playAstronaut()
    }
    
    func playAstronaut() {
        guard let url = Bundle.main.url(forResource: "astronaut", withExtension: "mp3") else { return }

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
        playApplaud()
    }
    
    func playApplaud() {
        guard let url = Bundle.main.url(forResource: "applaud", withExtension: "mp3") else { return }

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

}
