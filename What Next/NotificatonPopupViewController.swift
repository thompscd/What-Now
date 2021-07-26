//
//  NotificatonPopupViewController.swift
//  What Next
//
//  Created by Andy Thompson on 26/07/2021.
//

import UIKit

class NotificatonPopupViewController: UIViewController {

    var whatnextDB = FMDatabase()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        openDatabase()
        displayUnreadNotifications()
        
    }
    
    // scroll through each unread nofitication and display the details
    func displayUnreadNotifications () {
        
        print ("In NotificatonPopupViewController")
        
        // display each unread notification
        let querySQL = "SELECT id, pupilloginname, teacherloginname, notification, datesubmitted, dateread, priority FROM NOTIFICATIONS WHERE pupilloginname = '\(GlobalVar.loginname)';"
        var results:FMResultSet? = whatnextDB.executeQuery(querySQL, withArgumentsIn:[]);

        while results?.next()==true {
            let id = results?.int(forColumn:"id");
            let pupilloginname : String = results?.string(forColumn:"pupilloginname") ?? "";
            let teacherloginname : String = results?.string(forColumn:"teacherloginname") ?? "";
            let notification : String = results?.string(forColumn:"notification") ?? "";
            let datesubmitted : String = results?.string(forColumn:"datesubmitted") ?? "";
            let priority : String = results?.string(forColumn:"priority") ?? "";
            let dateread : String = results?.string(forColumn:"dateread") ?? "";
            print ("============================================")
            print ("id = ",id ?? 0)
            print ("pupilloginname = ", pupilloginname)
            print ("teacherloginname = ", teacherloginname)
            print ("notification = ", notification)
            print ("datesubmitted = ", datesubmitted)
            print ("dateread = ", dateread)
            print ("priority = ", priority)

        }
        
        // grey out the Next key and wait for Cancel button
        
    }
    
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
