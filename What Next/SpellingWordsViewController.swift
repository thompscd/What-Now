//
//  SpellingWordsViewController.swift
//  What Next
//
//  Created by Christopher Thompson on 27/07/2021.
//

import UIKit

class SpellingWordsViewController: UIViewController {

    @IBOutlet weak var dayToolbar: UIToolbar!
    @IBOutlet weak var mondayButton: UIBarButtonItem!
    
    @IBOutlet weak var mondayWords: UIStackView!
    @IBOutlet weak var tuesdayWords: UIStackView!
    @IBOutlet weak var wednesdayWords: UIStackView!
    @IBOutlet weak var thursdayWords: UIStackView!
    @IBOutlet weak var fridayWords: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*
        //Creating Monday tab on Toolbar.
        let item1 = UIBarButtonItem(title: "Monday", style: UIBarButtonItem.Style.plain, target: self, action:(Selector(("startMonday:"))))
        
        let item2 = UIBarButtonItem(title: "Tuesday", style: UIBarButtonItem.Style.plain, target: self, action:(Selector(("startTuesday:"))))
        
        let item3 = UIBarButtonItem(title: "Wednesday", style: UIBarButtonItem.Style.plain, target: self, action: Selector(("startWednesday")))
        
        let item4 = UIBarButtonItem(title: "Thursday", style: UIBarButtonItem.Style.plain, target: self, action: Selector(("startThursday")))
        
        //Adding tabs onto Toolbar.
        dayToolbar.items?.append(item1)
        dayToolbar.items?.append(item2)
        dayToolbar.items?.append(item3)
        dayToolbar.items?.append(item4)
 */
    }
    
    
    @IBAction func mondayButtonPressed(_ sender: UIBarButtonItem) {
        mondayWords.isHidden = false
        tuesdayWords.isHidden = true
        wednesdayWords.isHidden = true
        thursdayWords.isHidden = true
        fridayWords.isHidden = true
        
    }
    
    @IBAction func tuesdayButtonPressed(_ sender: UIBarButtonItem) {
        mondayWords.isHidden = true
        tuesdayWords.isHidden = false
        wednesdayWords.isHidden = true
        thursdayWords.isHidden = true
        fridayWords.isHidden = true
    }
    
    @IBAction func wednesdayButtonPressed(_ sender: UIBarButtonItem) {
        mondayWords.isHidden = true
        tuesdayWords.isHidden = true
        wednesdayWords.isHidden = false
        thursdayWords.isHidden = true
        fridayWords.isHidden = true
    }
    
    @IBAction func thursdayButtonPressed(_ sender: UIBarButtonItem) {
        mondayWords.isHidden = true
        tuesdayWords.isHidden = true
        wednesdayWords.isHidden = true
        thursdayWords.isHidden = false
        fridayWords.isHidden = true
    }
    
    @IBAction func fridayButtonPressed(_ sender: UIBarButtonItem) {
        mondayWords.isHidden = true
        tuesdayWords.isHidden = true
        wednesdayWords.isHidden = true
        thursdayWords.isHidden = true
        fridayWords.isHidden = false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
