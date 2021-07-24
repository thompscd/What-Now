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
let insertCommentSQL1 = "INSERT INTO COMMENTS (id,loginname, comment, date, liked, moodlevel) VALUES (null,'mrburn','Well done. Keep up the great work!','10 July 2021 16:20', 0, 1);"
let insertCommentSQL2 = "INSERT INTO COMMENTS (id,loginname, comment, date, liked, moodlevel) VALUES (null,'mikey','I really enjoyed today!','14 July 2021 16:20', 1, 2);"

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
    // database variables
    static var whatnextDB = FMDatabase ()
    // teacher suffix and surname
    static var suffix : String = "";
    static var lastname : String = "";
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Create new or open existing SQLite database
        let filemgr = FileManager.default
        let dirPaths = filemgr.urls(for: .documentDirectory,
                       in: .userDomainMask)
        databasePath = dirPaths[0].appendingPathComponent("whatnext.db").path
        
        if !filemgr.fileExists(atPath: databasePath as String) {
            
            GlobalVar.whatnextDB = FMDatabase(path: databasePath as String)

            if GlobalVar.whatnextDB == nil {
                print("Error: \(GlobalVar.whatnextDB.lastErrorMessage())")
            }
            
            if (GlobalVar.whatnextDB.open()) {
                // create pupil table
                let sql_stmt = "CREATE TABLE IF NOT EXISTS PUPIL (LOGINNAME TEXT PRIMARY KEY, FIRSTNAME TEXT, LASTNAME TEXT, LASTLOGIN TEXT, PASSWORD TEXT);"
                // create teacher table
                let sql_stmt2 = "CREATE TABLE IF NOT EXISTS TEACHER (LOGINNAME TEXT PRIMARY KEY, SUFFIX TEXT, FIRSTNAME TEXT, LASTNAME TEXT, PASSWORD TEXT, EMAIL TEXT);"
                // create comments table
                let sql_stmt3 = "CREATE TABLE IF NOT EXISTS COMMENTS (ID INTEGER PRIMARY KEY AUTOINCREMENT,LOGINNAME TEXT, COMMENT TEXT, DATE TEXT, LIKED INTEGER, MOODLEVEL INTEGER);"


                if !(GlobalVar.whatnextDB.executeStatements(sql_stmt)) {
                    print("Error: \(GlobalVar.whatnextDB.lastErrorMessage())")
                }
                if !(GlobalVar.whatnextDB.executeStatements(sql_stmt2)) {
                    print("Error: \(GlobalVar.whatnextDB.lastErrorMessage())")
                }
                if !(GlobalVar.whatnextDB.executeStatements(sql_stmt3)) {
                    print("Error: \(GlobalVar.whatnextDB.lastErrorMessage())")
                }
                populatePupilTable();      //DEBUG - add pupils to table
                populateTeacherTable();    //DEBUG - add teachers to table
                populateCommentsTable();    //DEBUG - add comments to table

                // DEBuG GlobalVar.whatnextDB.close();
            } else {
                print("Error: \(GlobalVar.whatnextDB.lastErrorMessage())")
            }
        }

    } // ViewDidLoad

    // function to populate PUPIL table until feature added to app
    func populatePupilTable () {
        if (GlobalVar.whatnextDB.open()) {
            print("ViewController - populating PUPIL table with entries")
            let result1 = GlobalVar.whatnextDB.executeUpdate(insertPupilSQL1,withArgumentsIn: [] );
            let result2 = GlobalVar.whatnextDB.executeUpdate(insertPupilSQL2,withArgumentsIn: [] )
            let result3 = GlobalVar.whatnextDB.executeUpdate(insertPupilSQL3,withArgumentsIn: [] )
        }
    } // populatePupilTable

    // function to populate PUPIL table until feature added to app
    func populateTeacherTable () {
        if (GlobalVar.whatnextDB.open()) {
            print("ViewController - populating TEACHER table with entries")
            let result1 = GlobalVar.whatnextDB.executeUpdate(insertTeacherSQL1,withArgumentsIn: [] );
            let result2 = GlobalVar.whatnextDB.executeUpdate(insertTeacherSQL2,withArgumentsIn: [] )
        }
    } // populatePupilTable
    
    // function to populate COMMENTS table until feature added to app
    func populateCommentsTable () {
        if (GlobalVar.whatnextDB.open()) {
            print("ViewController - populating COMMENTS table with entries")
            let result1 = GlobalVar.whatnextDB.executeUpdate(insertCommentSQL1,withArgumentsIn: [] );
            let result2 = GlobalVar.whatnextDB.executeUpdate(insertCommentSQL2,withArgumentsIn: [] )

        }
    } // populatePupilTable
}


