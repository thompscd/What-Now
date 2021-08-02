//
//  ActivityReflectionPopupViewController.swift
//  What Next
//
//  Created by Chris Thompson on 15/07/2021.
//

import UIKit

class ActivityReflectionPopupViewController: UIViewController {
    
    //@IBOutlet weak var commentTextField: UITextField!
    @IBOutlet weak var activityTitleLabel: UILabel!
    @IBOutlet weak var reflectionTextField: UITextField!
    
    //@IBOutlet weak var commentTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //add title to the reflection popup
        activityTitleLabel.text = GlobalVar.activityRefelection;
    }
    
    @IBAction func submitButtonPressed(_ sender: Any) {

        // add the comment to the database
        print (GlobalVar.activityRefelection, ": adding new comment to db")
        
        // format the date & time
        let df = DateFormatter()
        df.dateFormat = "dd-MM-yyyy hh:mm"
        let dateTime = df.string(from: Date())
        print ("date time is ", dateTime)
        
        let comment : String = reflectionTextField.text ?? "";

        // add "Speed Writing Activity" to start of comment
        let querySQL = "INSERT INTO COMMENTS (id, loginname, activity, comment, date, liked, moodlevel) VALUES (null,'\(GlobalVar.loginname)','\(GlobalVar.activityRefelection)', '\(comment)', '\(dateTime)', 1, '\(GlobalVar.moodlevel_none)');"

        //let querySQL = "INSERT INTO COMMENTS (id, loginname, recipient, activity, comment, date, liked, moodlevel) VALUES (null,'\(GlobalVar.loginname)','\(GlobalVar.loginname)', '\(GlobalVar.activityRefelection)', '\(comment)', '\(dateTime)', 1, '\(GlobalVar.moodlevel_none)');"

        let results = GlobalVar.whatNextDB.executeUpdate(querySQL, withArgumentsIn:[]);
        
        dismiss(animated:true,completion:nil)

    }
    
    @IBAction func dismissButtonPressed2(_ sender: Any) {
        dismiss(animated:true,completion:nil)
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
