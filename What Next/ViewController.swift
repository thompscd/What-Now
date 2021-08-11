//
//  ViewController.swift
//  What Next
//
//  Created by Chris Thompson on 03/07/2021.
//

import UIKit

// SQL statemtents to populate the database (needed until the functionality added to screens)
let insertPupilSQL1 = "INSERT INTO PUPIL (loginname, firstname, lastname, lastlogin, password) VALUES ('bobthebuilder','Bob','Robertson','4 July 2021 8:24','hello');"
let insertPupilSQL2 = "INSERT INTO PUPIL (loginname, firstname, lastname, lastlogin, password) VALUES ('mikey','Mike','Smith','20 June 2021 16:20','cheerio');"
let insertPupilSQL3 = "INSERT INTO PUPIL (loginname, firstname, lastname, lastlogin, password) VALUES ('sasha','Sasha','Tomlinson','10 June 2021 16:20','brodie');"
let insertTeacherSQL1 = "INSERT INTO TEACHER (loginname, suffix, firstname, lastname, password, email) VALUES ('mrburn','Mr','James','Burn','bestteacher','jburn@fraseracademy.edu');"
let insertTeacherSQL2 = "INSERT INTO TEACHER (loginname, suffix, firstname, lastname, password, email) VALUES ('msdocherty','Ms','Elaine','Docherty','sashathedog','edocherty@fraseracademy.edu');"
let insertCommentSQL1 = "INSERT INTO COMMENTS (id,loginname, recipient, activity, comment, date, liked, moodlevel) VALUES (null,'mrburn','mikey', '','Well done. Keep up the great work!','10 July 2021 16:20', 0, 1);"
let insertCommentSQL2 = "INSERT INTO COMMENTS (id,loginname, recipient, activity, comment, date, liked, moodlevel) VALUES (null,'mikey','mikey', '','I really enjoyed today!','14 July 2021 16:20', 1, 2);"
let insertNotificationSQL1 = "INSERT INTO NOTIFICATIONS (id, pupilloginname, teacherloginname, notification, datesubmitted, dateread, priority) VALUES (null,'mikey','mrburn','Please attend the support meeting on Friday, 1PM in my office. Thanks.','10 July 2021 16:20', '',1);"
let insertNotificationSQL2 = "INSERT INTO NOTIFICATIONS (id, pupilloginname, teacherloginname, notification, datesubmitted, dateread, priority) VALUES (null,'mikey','mrburn','Lets get together to discuss homework objectives for this week. Any time Friday is good for me. Thanks.','21 July 2021 16:20', '',0);"
let insertNotificationSQL3 = "INSERT INTO NOTIFICATIONS (id, pupilloginname, teacherloginname, notification, datesubmitted, dateread, priority) VALUES (null,'sasha','mrburn','Lets get together to discuss homework objectives for this week. Any time Friday is good for me. Thanks.','22 July 2021 16:20', '',2);"

var databasePath = String()

// Global data to be passed between controllers
struct GlobalVar {
    //loginname shared between View Controllers
    static var loginname : String  = "";
    
    // moodlevels
    static let moodlevel_none : Int = 0 ; //mood level not selected
    static let moodlevel_happy : Int = 1 ;
    static let moodlevel_ok : Int = 2 ;
    static let moodlevel_sad : Int = 3 ;
    
    // notification priority
    static let notificationPriorityUnselected : Int = -1 ;
    static let notificationPriorityUrgent : Int = 0 ;
    static let notificationPriorityNormal : Int = 1 ;
    static let notificationPriorityLow : Int = 2 ;

    // database holding teacher, pupil, comments, notifications
    static var whatNextDB = FMDatabase ()
    
    // teacher suffix and surname
    static var suffix : String = "";
    static var lastname : String = "";
    
    // pupil postings username
    static var pupilPostingsUsername : String = "";
    
    // flag indicating if unreadNotifictionsPopup has been displayed
    static var unreadNotificationsPopupDisplayed : Bool = false;
    
    // holds the name of the activity being reflected on (shown on pop-up)
    static var activityRefelection : String = "";
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        GlobalVar.unreadNotificationsPopupDisplayed = false; // ensure popup displayed since new login

        createDatabase();
        
        // populate the tables for development/test purposes
        populatePupilTable();           //DEBUG - add pupils to table
        populateTeacherTable();         //DEBUG - add teachers to table
        populateCommentsTable();        //DEBUG - add comments to table
        populateNotificationsTable();   //DEBUG - add Notifications to table


    } // ViewDidLoad

    
    // function to create the tables in the database
    func createDatabase () {
        
        // Create new or open existing SQLite database
        let filemgr = FileManager.default
        let dirPaths = filemgr.urls(for: .documentDirectory,
                       in: .userDomainMask)
        databasePath = dirPaths[0].appendingPathComponent("whatnext.db").path
        
        if !filemgr.fileExists(atPath: databasePath as String) {
            
            GlobalVar.whatNextDB = FMDatabase(path: databasePath as String)

            if GlobalVar.whatNextDB == nil {
                print("Error: \(GlobalVar.whatNextDB.lastErrorMessage())")
            }
            
            if (GlobalVar.whatNextDB.open()) {
                // create pupil table
                let sql_stmt = "CREATE TABLE IF NOT EXISTS PUPIL (LOGINNAME TEXT PRIMARY KEY, FIRSTNAME TEXT, LASTNAME TEXT, LASTLOGIN TEXT, PASSWORD TEXT);"
                // create teacher table
                let sql_stmt2 = "CREATE TABLE IF NOT EXISTS TEACHER (LOGINNAME TEXT PRIMARY KEY, SUFFIX TEXT, FIRSTNAME TEXT, LASTNAME TEXT, PASSWORD TEXT, EMAIL TEXT);"
                // create comments table
                let sql_stmt3 = "CREATE TABLE IF NOT EXISTS COMMENTS (ID INTEGER PRIMARY KEY AUTOINCREMENT,LOGINNAME TEXT, RECIPIENT TEXT, ACTIVITY TEXT, COMMENT TEXT, DATE TEXT, LIKED INTEGER, MOODLEVEL INTEGER);"
                // create notifications table
                let sql_stmt4 = "CREATE TABLE IF NOT EXISTS NOTIFICATIONS (ID INTEGER PRIMARY KEY AUTOINCREMENT,PUPILLOGINNAME TEXT, TEACHERLOGINNAME TEXT, NOTIFICATION TEXT, DATESUBMITTED TEXT, DATEREAD TEXT, PRIORITY INTEGER);"

                
                if !(GlobalVar.whatNextDB.executeStatements(sql_stmt)) {
                    print("Error: \(GlobalVar.whatNextDB.lastErrorMessage())")
                }
                if !(GlobalVar.whatNextDB.executeStatements(sql_stmt2)) {
                    print("Error: \(GlobalVar.whatNextDB.lastErrorMessage())")
                }
                if !(GlobalVar.whatNextDB.executeStatements(sql_stmt3)) {
                    print("Error: \(GlobalVar.whatNextDB.lastErrorMessage())")
                }
                if !(GlobalVar.whatNextDB.executeStatements(sql_stmt4)) {
                    print("Error: \(GlobalVar.whatNextDB.lastErrorMessage())")
                }
                
                // DEBuG GlobalVar.whatnextDB.close();
            } else {
                print("Error: \(GlobalVar.whatNextDB.lastErrorMessage())")
            }
        }
        
    } //createDatabase
    
    // function to populate PUPIL table until feature added to app
    func populatePupilTable () {
        if (GlobalVar.whatNextDB.open()) {
            let result1 = GlobalVar.whatNextDB.executeUpdate(insertPupilSQL1,withArgumentsIn: [] );
            let result2 = GlobalVar.whatNextDB.executeUpdate(insertPupilSQL2,withArgumentsIn: [] )
            let result3 = GlobalVar.whatNextDB.executeUpdate(insertPupilSQL3,withArgumentsIn: [] )
        }
    } // populatePupilTable

    // function to populate PUPIL table until feature added to app
    func populateTeacherTable () {
        if (GlobalVar.whatNextDB.open()) {
            let result1 = GlobalVar.whatNextDB.executeUpdate(insertTeacherSQL1,withArgumentsIn: [] );
            let result2 = GlobalVar.whatNextDB.executeUpdate(insertTeacherSQL2,withArgumentsIn: [] )
        }
    } // populatePupilTable
    
    // function to populate COMMENTS table until feature added to app
    func populateCommentsTable () {
        if (GlobalVar.whatNextDB.open()) {
            let result1 = GlobalVar.whatNextDB.executeUpdate(insertCommentSQL1,withArgumentsIn: [] );
            let result2 = GlobalVar.whatNextDB.executeUpdate(insertCommentSQL2,withArgumentsIn: [] )

        }
    } // populateCommentsTable
    
    // function to populate NOTIFICATIONS table until feature added to app
    func populateNotificationsTable () {
        if (GlobalVar.whatNextDB.open()) {
            let result1 = GlobalVar.whatNextDB.executeUpdate(insertNotificationSQL1,withArgumentsIn: [] );
            let result2 = GlobalVar.whatNextDB.executeUpdate(insertNotificationSQL2,withArgumentsIn: [] );
            let result3 = GlobalVar.whatNextDB.executeUpdate(insertNotificationSQL3,withArgumentsIn: [] );
        }
    } // populateNotificationsTable
}


