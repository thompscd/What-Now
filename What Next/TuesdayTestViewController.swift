//
//  TuesdayTestViewController.swift
//  What Next
//
//  Created by Christopher Thompson on 01/08/2021.
//

import UIKit
import AVKit

class TuesdayTestViewController: UIViewController {
    
    @IBOutlet weak var girlsAnswer: UITextField!
    @IBOutlet weak var girlsMark: UILabel!
    
    @IBOutlet weak var mensAnswer: UITextField!
    @IBOutlet weak var mensMark: UILabel!
    
    @IBOutlet weak var babiesAnswer: UITextField!
    @IBOutlet weak var babiesMark: UILabel!
    
    @IBOutlet weak var parentsAnswer: UITextField!
    @IBOutlet weak var parentsMark: UILabel!
    
    @IBOutlet weak var teachersAnswer: UITextField!
    @IBOutlet weak var teachersMark: UILabel!
    
    @IBOutlet weak var womensAnswer: UITextField!
    @IBOutlet weak var womensMark: UILabel!
    
    @IBOutlet weak var boysAnswer: UITextField!
    @IBOutlet weak var boysMark: UILabel!
    
    @IBOutlet weak var childrensAnswer: UITextField!
    @IBOutlet weak var childrensMark: UILabel!
    
    @IBOutlet weak var peoplesAnswer: UITextField!
    @IBOutlet weak var peoplesMark: UILabel!
    
    @IBOutlet weak var micesAnswer: UITextField!
    @IBOutlet weak var micesMark: UILabel!
    
    
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
    func checkTuesdayAnswers(){
        
        //girls
        if self.girlsAnswer.text == "Girls’" {
            self.girlsMark.text = "Correct!"
        } else {
            self.girlsMark.text = "Incorrect"
        }
        girlsAnswer.isUserInteractionEnabled = false
        
        //mens
        if self.mensAnswer.text == "Men’s" {
            self.mensMark.text = "Correct!"
        } else {
            self.mensMark.text = "Incorrect"
        }
        mensAnswer.isUserInteractionEnabled = false
        
        //babies'
        if self.babiesAnswer.text == "Babies’" {
            self.babiesMark.text = "Correct!"
        } else {
            self.babiesMark.text = "Incorrect"
        }
        babiesAnswer.isUserInteractionEnabled = false
        
        //parents
        if self.parentsAnswer.text == "Parents’" {
            self.parentsMark.text = "Correct!"
        } else {
            self.parentsMark.text = "Incorrect"
        }
        parentsAnswer.isUserInteractionEnabled = false
        
        //teachers
        if self.teachersAnswer.text == "Teachers’" {
            self.teachersMark.text = "Correct!"
        } else {
            self.teachersMark.text = "Incorrect"
        }
        teachersAnswer.isUserInteractionEnabled = false
        
        //womens
        if self.womensAnswer.text == "Women’s" {
            self.womensMark.text = "Correct!"
        } else {
            self.womensMark.text = "Incorrect"
        }
        womensAnswer.isUserInteractionEnabled = false
        
        //boys
        if self.boysAnswer.text == "Boys’" {
            self.boysMark.text = "Correct!"
        } else {
            self.boysMark.text = "Incorrect"
        }
        boysAnswer.isUserInteractionEnabled = false
        
        //childrens
        if self.childrensAnswer.text == "Children’s" {
            self.childrensMark.text = "Correct!"
        } else {
            self.childrensMark.text = "Incorrect"
        }
        childrensAnswer.isUserInteractionEnabled = false
        
        //peoples
        if self.peoplesAnswer.text == "People’s" {
            self.peoplesMark.text = "Correct!"
        } else {
            self.peoplesMark.text = "Incorrect"
        }
        peoplesAnswer.isUserInteractionEnabled = false
        
        //mices
        if self.micesAnswer.text == "Mice’s" {
            self.micesMark.text = "Correct!"
        } else {
            self.micesMark.text = "Incorrect"
        }
        micesAnswer.isUserInteractionEnabled = false
    }
    
    // Function will check answers, tally score and input appropriate feedback.
    @IBAction func onClickSubmitResponses(_ sender: UIButton) {
        checkTuesdayAnswers()
        calculateScore()
        giveFeedback()
    }
    
    //Calculate the total score and update score label with every correct answer.
    func calculateScore() {
        totalScore = 0
        if girlsMark.text == "Correct!" {
            totalScore += 1
        }
        if mensMark.text == "Correct!" {
            totalScore += 1
        }
        if babiesMark.text == "Correct!" {
            totalScore += 1
        }
        if parentsMark.text == "Correct!" {
            totalScore += 1
        }
        if teachersMark.text == "Correct!" {
            totalScore += 1
        }
        if womensMark.text == "Correct!" {
            totalScore += 1
        }
        if boysMark.text == "Correct!" {
            totalScore += 1
        }
        if childrensMark.text == "Correct!" {
            totalScore += 1
        }
        if peoplesMark.text == "Correct!" {
            totalScore += 1
        }
        if micesMark.text == "Correct!" {
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
        playGirls()
    }
    
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
    
    @IBAction func secondWordPressed(_ sender: UIButton) {
        playMens()
    }
    
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
    
    @IBAction func thirdWordPressed(_ sender: UIButton) {
        playBabies()
    }
    
    func playBabies() {
        guard let url = Bundle.main.url(forResource: "babies", withExtension: "mp3") else { return }

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
        playParents()
    }
    
    func playParents() {
        guard let url = Bundle.main.url(forResource: "parents", withExtension: "mp3") else { return }

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
        playTeachers()
    }
    
    func playTeachers() {
        guard let url = Bundle.main.url(forResource: "teachers", withExtension: "mp3") else { return }

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
        playWomens()
    }
    
    func playWomens() {
        guard let url = Bundle.main.url(forResource: "womens", withExtension: "mp3") else { return }

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
    
    @IBAction func eigthWordPressed(_ sender: UIButton) {
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
    
    @IBAction func ninthWordPressed(_ sender: UIButton) {
        playPeoples()
    }
    
    func playPeoples() {
        guard let url = Bundle.main.url(forResource: "peoples", withExtension: "mp3") else { return }

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
        playMices()
    }
    
    func playMices() {
        guard let url = Bundle.main.url(forResource: "mices", withExtension: "mp3") else { return }

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
    

