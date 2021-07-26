//
//  MainPageViewController.swift
//  What Next
//
//  Created by Chris Thompson on 08/07/2021.
//

import UIKit

class MainPageViewController: UIViewController, UITextFieldDelegate, UISearchBarDelegate {

    @IBOutlet weak var leading: NSLayoutConstraint!
    @IBOutlet weak var trailing: NSLayoutConstraint!
    
    @IBOutlet weak var CommentsTextView: UITextView!
    
    @IBOutlet weak var searchTextView: UISearchBar!
    
    var menuOut = false;
    var whatnextDB = FMDatabase()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // needed so that keyboard on ipad/iphone disappears on return key
        self.searchTextView.delegate = self;
        
        openDatabase()
        displayComments()
    }
    
    // needed so that keyboard on ipad/iphone disappears on return key
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
  
    // displays the hamburger menu
    @IBAction func menuButtonClick(_ sender: Any) {
        
        print ("In menuButtonClick")
        if menuOut == false {
            leading.constant = 280;
            trailing.constant = -280;
            menuOut = true;
        } else {
            leading.constant = 0;
            trailing.constant = 0;
            menuOut = false;
        }
        
        UIView.animate(withDuration: 0.3, delay: 0.0, options: .curveEaseIn, animations: {
            self.view.layoutIfNeeded()
        }) { (animationComplete) in
            print("The animation is complete!")
        }
        
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
    
    // extract comments from the database and display in the textField
    func displayComments () {
        
        // sql query to extract all the comments
        let querySQL = "SELECT loginname, comment, date, moodlevel FROM COMMENTS;"
        var results:FMResultSet? = whatnextDB.executeQuery(querySQL, withArgumentsIn:[]);
        while results?.next()==true {
            print ("comment found");""
            let loginname : String = results?.string(forColumn:"loginname") ?? "";
            let comment : String = results?.string(forColumn:"comment") ?? "";
            let date : String = results?.string(forColumn:"date") ?? "";
            let moodlevel : Int = results?.long(forColumn:"moodlevel") ?? 0;

            // check if the comment is from teacher or pupil
            let querySQL2 = "SELECT suffix, lastname FROM TEACHER WHERE loginname = '\(loginname)';"
            let results2:FMResultSet? = whatnextDB.executeQuery(querySQL2, withArgumentsIn:[]);
            if results2?.next()==true {
                // teacher comment
                print ("Teacher comment!!")
                let suffix : String = results2?.string(forColumn:"suffix") ?? "";
                let lastname : String = results2?.string(forColumn:"lastname") ?? "";
                // Display on Comments TextView
                CommentsTextView.insertText ("\n\n");
                CommentsTextView.insertText (suffix+" "+lastname);
                CommentsTextView.insertText ("\nClassroom Teacher");
                CommentsTextView.insertText ("\n\n"+"\""+comment+"\"");
                CommentsTextView.insertText ("\n"+"Date: "+date);
                CommentsTextView.insertText ("\n\n===========================");
            }
            else {
                // check if the usernane is in pupil table
                
                // pupil comment
                print ("Pupil comment!!")
                let querySQL3 = "SELECT firstname, lastname FROM PUPIL WHERE loginname = '\(loginname)';"

                let results3:FMResultSet? = whatnextDB.executeQuery(querySQL3, withArgumentsIn:[]);
                if results3?.next()==true {
                    let firstname : String = results3?.string(forColumn:"firstname") ?? "";
                    let lastname : String = results3?.string(forColumn:"lastname") ?? "";
                    // Display on Comments TextView
                    CommentsTextView.insertText ("\n\n");
                    CommentsTextView.insertText (firstname+" "+lastname);
                    CommentsTextView.insertText ("\nPupil");
                    CommentsTextView.insertText ("\n\n"+"\""+comment+"\"");

                    if (moodlevel == GlobalVar.moodlevel_none) {
                        // ignore - no mood level selected by the pupil
                    } else if (moodlevel == GlobalVar.moodlevel_happy) {
                        // Happy
                        CommentsTextView.insertText ("\n\nMood level : Happy");
                    } else if (moodlevel == GlobalVar.moodlevel_ok) {
                        // ok
                        CommentsTextView.insertText ("\n\nMood level : ok");
                    } else if (moodlevel == GlobalVar.moodlevel_sad) {
                        // sad
                        CommentsTextView.insertText ("\n\nMood level : sad");
                    }
                    CommentsTextView.insertText ("\n"+"Date: "+date);
                    CommentsTextView.insertText ("\n\n===========================");
                } else {
                    // username is not in TEACHER or PUPIL table - report an error
                }
            }

        }
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
