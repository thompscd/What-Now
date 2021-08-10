//
//  MoodPopupViewController.swift
//  What Next
//
//  Created by Chris Thompson on 15/07/2021.
//

import UIKit

class MoodPopupViewController: UIViewController {
    
    @IBOutlet weak var happyButton: UIButton!
    @IBOutlet weak var okButton: UIButton!
    @IBOutlet weak var sadButton: UIButton!
    @IBOutlet weak var commentTextField: UITextField!
    
    var moodLevel : Int = GlobalVar.moodlevel_none;   //0=unknown, 1=happy, 2=ok, 3=sad
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // happy button pressed so gray out others
    @IBAction func happyButtonPressed(_ sender: Any) {
        moodLevel = GlobalVar.moodlevel_happy;
        happyButton.setImage(UIImage(named: "happy face.png"), for: .normal)
        okButton.setImage(UIImage(named: "ok face large gray.png"), for: .normal)
        sadButton.setImage(UIImage(named: "sad face large gray.png"), for: .normal)
    }
    
    // ok button pressed so gray out others
    @IBAction func okButtonPressed(_ sender: Any) {
        moodLevel = GlobalVar.moodlevel_ok;
        okButton.setImage(UIImage(named: "ok face.png"), for: .normal)
        happyButton.setImage(UIImage(named: "happy face large gray.png"), for: .normal)
        sadButton.setImage(UIImage(named: "sad face large gray.png"), for: .normal)

    }
    
    // sad button pressed so gray out others
    @IBAction func sadButtonPressed(_ sender: Any) {
        moodLevel = GlobalVar.moodlevel_sad;
        sadButton.setImage(UIImage(named: "sad face.png"), for: .normal)
        happyButton.setImage(UIImage(named: "happy face large gray.png"), for: .normal)
        okButton.setImage(UIImage(named: "ok face large gray.png"), for: .normal)

    }
    
    @IBAction func submitButtonPressed(_ sender: Any) {

        // add the comment to the database
        
        // format the date & time
        let df = DateFormatter()
        df.dateFormat = "dd-MM-yyyy hh:mm"
        let dateTime = df.string(from: Date())
        
        let comment : String = commentTextField.text ?? "";
        let querySQL = "INSERT INTO COMMENTS (id, loginname, recipient, activity, comment, date, liked, moodlevel) VALUES (null,'\(GlobalVar.loginname)','\(GlobalVar.loginname)','', '\(comment)','\(dateTime)', 1, \(moodLevel));"

        let results = GlobalVar.whatNextDB.executeUpdate(querySQL, withArgumentsIn:[]);
        
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
