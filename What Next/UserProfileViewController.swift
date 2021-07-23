//
//  UserProfileViewController.swift
//  What Next
//
//  Created by Lorraine Thompson on 19/07/2021.
//

import UIKit

class UserProfileViewController: UIViewController {

    
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var errorLabel2: UILabel!
    
    let loginname = GlobalVar.loginname;  
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        openDatabase();
        
    }
    
    
    @IBAction func backButtonPressed(_ sender: Any) {
        dismiss(animated:true,completion:nil)
    }
    
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
