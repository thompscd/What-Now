//
//  TeacherNotificationViewController.swift
//  What Next
//
//  Created by Andy Thompson on 24/07/2021.
//

import UIKit

class TeacherNotificationViewController: UIViewController {

    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var pupilTextField: UITextField!
    
    @IBOutlet weak var notificationTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        openDatabase();

    }
    
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
        
        // add notification to database
        if !error_found {
            // update database with new values
            // format the date & time
            let df = DateFormatter()
            df.dateFormat = "yyyy-MM-dd hh:mm:ss"
            let dateTime = df.string(from: Date())
            let insertNotificationSQL = "INSERT INTO NOTIFICATIONS (id, pupilloginname, teacherloginname, notification, datesubmitted, dateread, priority) VALUES (null,'\(pupilUserName )','\(GlobalVar.loginname)','\(notification)','\(dateTime)', '',1);"

            let results = whatnextDB.executeUpdate(insertNotificationSQL, withArgumentsIn:[]);
            
            // return to teacher home screen
            //dismiss(animated:true,completion:nil)  // update successful so close the screen
            performSegue(withIdentifier:"teacherSegue",sender:AnyObject.self);

        }
        
    
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
