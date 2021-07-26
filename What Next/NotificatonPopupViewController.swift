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
