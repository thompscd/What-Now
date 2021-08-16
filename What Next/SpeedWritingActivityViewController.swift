//
//  SpeedWritingActivityViewController.swift
//  What Next
//
//  Created by Christopher Thompson on 27/07/2021.
//

import UIKit

class SpeedWritingActivityViewController: UIViewController, UITextViewDelegate {
    
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var answerTextView: UITextView!
    @IBOutlet weak var scoreLabel: UILabel!
    
    var countdownTimer: Timer!
    var totalTime = 120
    var wordCount = 0
    lazy var activityWords = answerTextView.text.components(separatedBy:.whitespacesAndNewlines)
    let spellingWords = ["Caught", "Naughty", "Taught", "Daughter", "Autumn", "Clause", "Cause", "Astronaut", "Applaud", "Author", "Girls’", "Men’s", "Babies’", "Parents’", "Teachers’", "Women’s", "Boys’", "Children’s", "People’s", "Mice’s", "Creation", "Radiation", "Indication", "Ventilation", "Relegation", "Dedication", "Demonstration", "Abbreviation", "Translation", "Vibration", "Exit", "Extend", "Explode", "Excursion", "Exchange", "Export", "Exclaim", "Expel", "External", "Exterior"]

    override func viewDidLoad() {
        super.viewDidLoad()
        answerTextView.text = "Write your words here!"
        answerTextView.textColor = UIColor.lightGray
        answerTextView.delegate = self

        // update the activity reflection
        GlobalVar.activityRefelection = "Speed Writing Activity Reflection"
    }
    
    //Whiteboard Functions
    @IBAction func onClickSave(_ sender: UIButton) {
        let image = answerTextView.takeScreenShot()
        UIImageWriteToSavedPhotosAlbum(image, self, #selector(imageSaved(_:didFinishSavingWithError:contextType:)), nil)
    }
    
    @objc func imageSaved(_ image: UIImage, didFinishSavingWithError error: Error?, contextType: UnsafeRawPointer) {
        if error != nil {
            print("Unable to save the image into the photos.")
        } else {
            print("Image saved to photos!")
        }
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
            answerTextView.isUserInteractionEnabled = false
            totalTime = 120
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

    @IBAction func startPressed(_ sender: UIButton) {
        startTimer()
        answerTextView.isUserInteractionEnabled = true
        answerTextView.text = nil
    }
    
    //Using previous segue to return to previous screen when return pressed.
    @IBAction func returnToPreviousScreen(_ sender: UIButton) {
        performSegueToReturnBack()
    }
    
    //Remove Placeholder text when editing begins.
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = UIColor.black
        }
    }
    
    //Add Placeholder text when editing ends and no text has been added.
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "Write your words here!"
            textView.textColor = UIColor.lightGray
        }
    }
    
    //Count the amount of correctly spelt words.
    @IBAction func countWords(_ sender: UIButton) {
        //Reset word count to 0
        wordCount = 0
        // Loop through user input to check for spelling words.
        while activityWords.contains(where: spellingWords.contains){
            //For every correctly spelt word, add a tally onto word count.
            wordCount += 1
            //Remove the first correctly spelt word to avoid double counting.
            if let indexValue = activityWords.firstIndex(where: spellingWords.contains) {
                activityWords.remove(at: indexValue)
            }
            //Break loop when no more correct words are found.
            if activityWords.contains(where: spellingWords.contains) == false {
                break
            }
        }
        //Convert wordCount to a string and display as a label.
        scoreLabel.text = String(wordCount)
    }
    
}


extension UIView {
    
    func takeScreenShot() -> UIImage {
        UIGraphicsBeginImageContextWithOptions(self.bounds.size, false, UIScreen.main.scale)
        
        drawHierarchy(in: self.bounds, afterScreenUpdates: true)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        if image != nil{
            return image!
        }
        return UIImage()
    }
}
