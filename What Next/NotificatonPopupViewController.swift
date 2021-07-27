//
//  NotificatonPopupViewController.swift
//  What Next
//
//  Created by Andy Thompson on 26/07/2021.
//

import UIKit

class NotificatonPopupViewController: UIViewController {

    var whatnextDB = FMDatabase()
    
    @IBOutlet weak var fromLabel: UILabel!
    @IBOutlet weak var dateSubmitted: UILabel!
    @IBOutlet weak var notificationTextField: UITextField! //old. Ignore
    @IBOutlet weak var notificationTextView: UITextView!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var notificationLabel: UILabel!
    
    
    var results = FMResultSet();  //holds notifications extracted from database
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        openDatabase()
        extractNotifications()
        displayNextUnreadNotifications()
        
    }
    
    @IBAction func nextButtonPressed(_ sender: Any) {
        displayNextUnreadNotifications();
    }
    
    
    // extract notifications from database for this pupil
    func extractNotifications () {
        
        print ("In extractNotifications")
        
        let querySQL = "SELECT id, pupilloginname, teacherloginname, notification, datesubmitted, dateread, priority FROM NOTIFICATIONS WHERE pupilloginname = '\(GlobalVar.loginname)';"
        results = whatnextDB.executeQuery(querySQL, withArgumentsIn:[])! ;
        
    } // extractNotifications
    
    // display next unread nofitication
    func displayNextUnreadNotifications () {
        
        if results.next()==true {
            let dateread : String = results.string(forColumn:"dateread") ?? "";
            if dateread == "" {
                // notification is unread therefore display details
                let id = results.int(forColumn:"id");
                let pupilloginname : String = results.string(forColumn:"pupilloginname") ?? "";
                let teacherloginname : String = results.string(forColumn:"teacherloginname") ?? "";
                let notification : String = results.string(forColumn:"notification") ?? "";
                let submitted : String = results.string(forColumn:"datesubmitted") ?? "";
                let priority : Int = Int(results.int(forColumn:"priority")) ;
                
                
                // format the teacher name
                let querySQL = "SELECT loginname, suffix, firstname, lastname, password, email FROM TEACHER WHERE loginname = '\(teacherloginname.lowercased())';"
                let results:FMResultSet? = whatnextDB.executeQuery(querySQL, withArgumentsIn:[]);
                var fullTeacherName : String = "";
                if results?.next()==true {
                    let suffix : String = results?.string(forColumn:"suffix") ?? "";
                    let lastname : String = results?.string(forColumn:"lastname") ?? "";
                    fullTeacherName =  suffix + " " + lastname;
                }
                
                // format priority
                print ("about to update priority to ",priority)
                switch priority {
                    case GlobalVar.notificationPriorityLow : do {
                        notificationLabel.text = "Low"
                        notificationLabel.textColor = UIColor.black;
                    }
                    case GlobalVar.notificationPriorityNormal : do {
                        notificationLabel.text = "Normal"
                        notificationLabel.textColor = UIColor.black;
                    }
                    case GlobalVar.notificationPriorityUrgent : do {
                        notificationLabel.text = "Urgent"
                        notificationLabel.textColor = UIColor.red;
                    }
                    default : do {
                        notificationLabel.text = "Unknown"
                        notificationLabel.textColor = UIColor.black;
                    }
                } // end switch
                
                // updates the details on the popup
                fromLabel.text=fullTeacherName;
                dateSubmitted.text=submitted;
                notificationTextView.text = notification;
                
                // mark notification as read by setting the dateRead field
                print ("about to clear notification")
                let df = DateFormatter()
                df.dateFormat = "dd-MM-yyyy hh:mm"
                let dateTime = df.string(from: Date())
                let updateNotificationSQL = "UPDATE NOTIFICATIONS SET dateread = '\(dateTime)' WHERE id = \(id);"
                print (updateNotificationSQL)
                let results2:FMResultSet? = whatnextDB.executeQuery(updateNotificationSQL, withArgumentsIn:[]);
            }

        } else {
            // grey out and disable the Next key
            nextButton.isEnabled = false
            nextButton.setTitleColor(UIColor.gray, for: .disabled)

        }
        
    } // displayNextUnreadNotifications
    
    func openDatabase () {
        //////////////////////////////////////////
        // THIS IS A HACK. THIS IS CODE COPIED FROM ViewController.swift. NEED TO CHANGE SO THAT THE whatnextDB variable is passed between controllers !!!!!
        var databasePath = String();
        let filemgr = FileManager.default
        let dirPaths = filemgr.urls(for: .documentDirectory,
                       in: .userDomainMask)
        databasePath = dirPaths[0].appendingPathComponent("whatnext.db").path
        whatnextDB = FMDatabase(path: databasePath as String)
        if whatnextDB == nil {
            print("Error PupilLoginViewController: whatnextDB is nil, \(whatnextDB.lastErrorMessage())")
        } else {
            print ("PupilLoginViewControl: database not nil")
            if (whatnextDB.open()) {
                print ("PupilLoginViewControl: database is open")
            } else {
                print("Error PupilLoginViewController: whatnextDB not open, \(whatnextDB.lastErrorMessage())")
            }
        }
        // END OF HACK CODE !!!!!!!
        /////////////////////////////////////////////////
        
    } // openDatabase
    
 
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
