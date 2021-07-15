//
//  MoodPopupViewController.swift
//  What Next
//
//  Created by Lorraine Thompson on 15/07/2021.
//

import UIKit

class MoodPopupViewController: UIViewController {
    
    @IBOutlet weak var happyButton: UIButton!
    @IBOutlet weak var okButton: UIButton!
    @IBOutlet weak var sadButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // happy button pressed so gray out others
    @IBAction func happyButtonPressed(_ sender: Any) {
        happyButton.setImage(UIImage(named: "happy face smaller.png"), for: .normal)
        okButton.setImage(UIImage(named: "ok face gray.png"), for: .normal)
        sadButton.setImage(UIImage(named: "sad face gray.png"), for: .normal)
    }
    
    // ok button pressed so gray out others
    @IBAction func okButtonPressed(_ sender: Any) {
        okButton.setImage(UIImage(named: "ok face smaller.png"), for: .normal)
        happyButton.setImage(UIImage(named: "happy face gray.png"), for: .normal)
        sadButton.setImage(UIImage(named: "sad face gray.png"), for: .normal)
    }
    
    // sad button pressed so gray out others
    @IBAction func sadButtonPressed(_ sender: Any) {
        sadButton.setImage(UIImage(named: "sad face smaller.png"), for: .normal)
        happyButton.setImage(UIImage(named: "happy face gray.png"), for: .normal)
        okButton.setImage(UIImage(named: "ok face gray.png"), for: .normal)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
