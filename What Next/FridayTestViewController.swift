//
//  FridayTestViewController.swift
//  What Next
//
//  Created by Christopher Thompson on 01/08/2021.
//

import UIKit

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
            feedbackLabel.text = "You didn't manage to get many correct answers on this occasion. It looks like you need to gain a better understanding of the sound. Please go back to the lesson page and review further the materials there. It would also be benefitical to engage with some more activities. When you know you have a better understanding of the sound, reattempt this test. I know you can do it!"
        } else if totalScore >= 4 && totalScore <= 7 {
            feedbackLabel.text = "This was a fair attempt but I know you can do better! It would be a good idea to have another short review of the materials to ensure you have a full understanding! When you are ready return and have another go at the test! Good Luck!"
        } else if totalScore >= 8 && totalScore <= 9 {
            feedbackLabel.text = "This was a very strong attempt, well done! You obviously have a good understanding of this sound. You should have a short review of the words to ensure you understand the spellings and have another go to get 100%"
        } else {
            feedbackLabel.text = "100% Excellent! You've nailed your words and have shown a full understanding of the sound! You should be proud of your work!"
        }
    }
    

}
