//
//  TeacherNotificationViewController.swift
//  What Next
//
//  Created by Andy Thompson on 24/07/2021.
//

import UIKit

class TeacherNotificationViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var pupilTextField: UITextField!
    @IBOutlet weak var notificationTextView: UITextView!
    @IBOutlet weak var priortySelectBtn: UIButton!
    @IBOutlet var priortyLevelBtns: [UIButton]!
    
    var prioritySelected : Int = GlobalVar.notificationPriorityUnselected;
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.pupilTextField.delegate = self;

        openDatabase();
        hidePriorityPulldown();

    }
    
    // needed so that keyboard on ipad/iphone disappears on return key
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    func hidePriorityPulldown () {
        priortyLevelBtns.forEach { (levelBtn) in
            levelBtn.isHidden = true;
        }
    } // hidePriorityPulldown
    
    @IBAction func priorityBtnPressed(_ sender: UIButton) {
        priortyLevelBtns.forEach { (levelBtn) in
            UIView.animate(withDuration: 0.2, animations: {
                levelBtn.isHidden = !levelBtn.isHidden;
                self.view.layoutIfNeeded()
            })
        }
    } // priorityBtnPressed
    
    @IBAction func prorityBtnLevelPressed(_ sender: UIButton) {
        if let priortyLabel = sender.titleLabel?.text {
            print (priortyLabel)
            // bring dropdown back up
            priortyLevelBtns.forEach { (levelBtn) in
                UIView.animate(withDuration: 0.2, animations: {
                    levelBtn.isHidden = !levelBtn.isHidden;
                    self.view.layoutIfNeeded()
                })
            }
            // assign priority chosen to label
            priortySelectBtn.setTitle(priortyLabel, for: .normal);
            // save the priority so can be saved in database
            switch priortyLabel {
                case "Low" : do {
                    prioritySelected = GlobalVar.notificationPriorityLow;
                }
                case "Normal" : do {
                    prioritySelected = GlobalVar.notificationPriorityNormal;
                }
                case "Urgent" : do {
                    prioritySelected = GlobalVar.notificationPriorityUrgent;
                }
                default : do {
                    prioritySelected = GlobalVar.notificationPriorityUnselected;
                }
            }
        }
    } // prorityBtnLevelPressed
    
    @IBAction func submitButtonPressed(_ sender: Any) {
        
        // clear any error messages
        errorLabel.text = ""

        var error_found = false ;
        
        // check that pupil name is not empty
        let pupilUserName : String = pupilTextField.text ?? "";
        if pupilUserName == "" {
            errorLabel.text = "Error: pupil user name cannot be empty"
            error_found = true;
        }
        
        // check that the pupil is in the database
        if !error_found {
            let querySQL = "SELECT firstname, lastname, password FROM PUPIL WHERE loginname = '\(pupilUserName.lowercased())';"
            print("TeacherNotificationViewController - pupilUserName = ", pupilUserName)

            let results:FMResultSet? = whatnextDB.executeQuery(querySQL, withArgumentsIn:[]);
            if results?.next()==true {
                print("TeacherNotificationViewController - pupil is in database !!!!")
            } else {
                errorLabel.text = "Error: pupil does not exist"
                error_found = true;
            }
        }
        
        // check that notification is not empty
        let notification : String = notificationTextView.text ?? "";
        if !error_found {
            if notification == "" {
                errorLabel.text = "Error: notification text cannot be empty"
                error_found = true;
            }
        }
        
        // check that priority has been selected
        if !error_found {
            if prioritySelected == GlobalVar.notificationPriorityUnselected {
                errorLabel.text = "Error: please select a priority"
                error_found = true;
            }
        }
        
        // add notification to database
        if !error_found {
            // update database with new values
            // format the date & time
            let df = DateFormatter()
            //df.dateFormat = "yyyy-MM-dd hh:mm:ss"
            df.dateFormat = "dd-MM-yyyy hh:mm"
            let dateTime = df.string(from: Date())
            let insertNotificationSQL = "INSERT INTO NOTIFICATIONS (id, pupilloginname, teacherloginname, notification, datesubmitted, dateread, priority) VALUES (null,'\(pupilUserName.lowercased() )','\(GlobalVar.loginname)','\(notification)','\(dateTime)', '',\(prioritySelected));"
            let results = whatnextDB.executeUpdate(insertNotificationSQL, withArgumentsIn:[]);
            
            // return to teacher home screen
            //dismiss(animated:true,completion:nil)  // update successful so close the screen
            performSegue(withIdentifier:"teacherSegue",sender:AnyObject.self);

        }
        
        
        /*
         let insertNotificationSQL1 = "INSERT INTO NOTIFICATIONS (id, pupilloginname, teacherloginname, notification, datesubmitted, dateread, priority) VALUES (null,'mikey','mrburn','Please attend the support meeting on Friday, 1PM in my office. Thanks.','10 July 2021 16:20', '',1);"

         */
    } // submitButtonPressed
    
    
    var whatnextDB = FMDatabase(path: databasePath as String)
    
    func openDatabase () {
        // THIS IS A HACK. THIS IS CODE COPIED FROM ViewController.swift. NEED TO CHANGE SO THAT THE whatnextDB variable is passed between controllers !!!!!
        var databasePath = String();
        let filemgr = FileManager.default
        let dirPaths = filemgr.urls(for: .documentDirectory,
                       in: .userDomainMask)
        databasePath = dirPaths[0].appendingPathComponent("whatnext.db").path
        whatnextDB = FMDatabase(path: databasePath as String)
        if whatnextDB == nil {
            print("Error UserProfileViewController: whatnextDB is nil, \(whatnextDB.lastErrorMessage())")
        } else {
            print ("UserProfileViewControl: database not nil")
            if (whatnextDB.open()) {
                print ("UserProfileViewControl: database is open")
            } else {
                print("Error UserProfileViewController: whatnextDB not open, \(whatnextDB.lastErrorMessage())")
            }
        }
        // END OF HACK CODE !!!!!!!
        /////////////////////////////////////////////////
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
