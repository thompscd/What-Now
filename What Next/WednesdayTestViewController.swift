//
//  WednesdayTestViewController.swift
//  What Next
//
//  Created by Christopher Thompson on 01/08/2021.
//

import UIKit
import AVKit

class WednesdayTestViewController: UIViewController {
    
    @IBOutlet weak var creationAnswer: UITextField!
    @IBOutlet weak var creationMark: UILabel!
    
    @IBOutlet weak var radiationAnswer: UITextField!
    @IBOutlet weak var radiationMark: UILabel!
    
    @IBOutlet weak var indicationAnswer: UITextField!
    @IBOutlet weak var indicationMark: UILabel!
    
    @IBOutlet weak var ventilationAnswer: UITextField!
    @IBOutlet weak var ventilationMark: UILabel!
    
    @IBOutlet weak var relegationAnswer: UITextField!
    @IBOutlet weak var relegationMark: UILabel!
    
    @IBOutlet weak var dedicationAnswer: UITextField!
    @IBOutlet weak var dedicationMark: UILabel!
    
    @IBOutlet weak var demonstrationAnswer: UITextField!
    @IBOutlet weak var demonstrationMark: UILabel!
    
    @IBOutlet weak var abbreviationAnswer: UITextField!
    @IBOutlet weak var abbreviationMark: UILabel!
    
    @IBOutlet weak var translationAnswer: UITextField!
    @IBOutlet weak var translationMark: UILabel!
    
    @IBOutlet weak var vibrationAnswer: UITextField!
    @IBOutlet weak var vibrationMark: UILabel!
    
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
    func checkWednesdayAnswers(){
        
        //creation
        if self.creationAnswer.text == "creation" {
            self.creationMark.text = "Correct!"
        } else {
            self.creationMark.text = "Incorrect"
        }
        creationAnswer.isUserInteractionEnabled = false
        
        //radiation
        if self.radiationAnswer.text == "radiation" {
            self.radiationMark.text = "Correct!"
        } else {
            self.radiationMark.text = "Incorrect"
        }
        radiationAnswer.isUserInteractionEnabled = false
        
        //indication
        if self.indicationAnswer.text == "indication" {
            self.indicationMark.text = "Correct!"
        } else {
            self.indicationMark.text = "Incorrect"
        }
        indicationAnswer.isUserInteractionEnabled = false
        
        //ventilation
        if self.ventilationAnswer.text == "ventilation" {
            self.ventilationMark.text = "Correct!"
        } else {
            self.ventilationMark.text = "Incorrect"
        }
        ventilationAnswer.isUserInteractionEnabled = false
        
        //relegation
        if self.relegationAnswer.text == "relegation" {
            self.relegationMark.text = "Correct!"
        } else {
            self.relegationMark.text = "Incorrect"
        }
        relegationAnswer.isUserInteractionEnabled = false
        
        //dedication
        if self.dedicationAnswer.text == "dedication" {
            self.dedicationMark.text = "Correct!"
        } else {
            self.dedicationMark.text = "Incorrect"
        }
        dedicationAnswer.isUserInteractionEnabled = false
        
        //demonstration
        if self.demonstrationAnswer.text == "demonstration" {
            self.demonstrationMark.text = "Correct!"
        } else {
            self.demonstrationMark.text = "Incorrect"
        }
        demonstrationAnswer.isUserInteractionEnabled = false
        
        //abbreviation
        if self.abbreviationAnswer.text == "abbreviation" {
            self.abbreviationMark.text = "Correct!"
        } else {
            self.abbreviationMark.text = "Incorrect"
        }
        abbreviationAnswer.isUserInteractionEnabled = false
        
        //translation
        if self.translationAnswer.text == "translation" {
            self.translationMark.text = "Correct!"
        } else {
            self.translationMark.text = "Incorrect"
        }
        translationAnswer.isUserInteractionEnabled = false
        
        //vibration
        if self.vibrationAnswer.text == "vibration" {
            self.vibrationMark.text = "Correct!"
        } else {
            self.vibrationMark.text = "Incorrect"
        }
        vibrationAnswer.isUserInteractionEnabled = false
    }
    
    // Function will check answers, tally score and input appropriate feedback.
    @IBAction func onClickSubmitResponses(_ sender: UIButton) {
        checkWednesdayAnswers()
        calculateScore()
        giveFeedback()
        endTimer()
    }
    
    //Calculate the total score and update score label with every correct answer.
    func calculateScore() {
        totalScore = 0
        if creationMark.text == "Correct!" {
            totalScore += 1
        }
        if radiationMark.text == "Correct!" {
            totalScore += 1
        }
        if indicationMark.text == "Correct!" {
            totalScore += 1
        }
        if ventilationMark.text == "Correct!" {
            totalScore += 1
        }
        if relegationMark.text == "Correct!" {
            totalScore += 1
        }
        if dedicationMark.text == "Correct!" {
            totalScore += 1
        }
        if demonstrationMark.text == "Correct!" {
            totalScore += 1
        }
        if abbreviationMark.text == "Correct!" {
            totalScore += 1
        }
        if translationMark.text == "Correct!" {
            totalScore += 1
        }
        if vibrationMark.text == "Correct!" {
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
    
    @IBAction func secondWordPressed(_ sender: UIButton) {
        playRadiation()
    }
    
    func playRadiation() {
        guard let url = Bundle.main.url(forResource: "radiation", withExtension: "mp3") else { return }

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
        playIndication()
    }
    
    func playIndication() {
        guard let url = Bundle.main.url(forResource: "indication", withExtension: "mp3") else { return }

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
        playVentilation()
    }
    
    func playVentilation() {
        guard let url = Bundle.main.url(forResource: "ventilation", withExtension: "mp3") else { return }

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
    
    @IBAction func sixthWordPressed(_ sender: UIButton) {
        playDedication()
    }
    
    func playDedication() {
        guard let url = Bundle.main.url(forResource: "dedication", withExtension: "mp3") else { return }

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
        playDemonstration()
    }
    func playDemonstration() {
        guard let url = Bundle.main.url(forResource: "demonstration", withExtension: "mp3") else { return }

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
        playAbbreviation()
    }
    
    func playAbbreviation() {
        guard let url = Bundle.main.url(forResource: "abbreviation", withExtension: "mp3") else { return }

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
        playTranslation()
    }
    
    func playTranslation() {
        guard let url = Bundle.main.url(forResource: "translation", withExtension: "mp3") else { return }

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
        playVibration()
    }
    
    func playVibration() {
        guard let url = Bundle.main.url(forResource: "vibration", withExtension: "mp3") else { return }

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
