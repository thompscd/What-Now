//
//  TeacherViewController.swift
//  What Next
//
//  Created by Chris Thompson on 24/07/2021.
//

import UIKit

class TeacherViewController: UIViewController {
    @IBOutlet weak var teacherNameLabel: UILabel!
    
    var menuOut = false;
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // add teacher name to the screen
        print ("In TeacherViewController !!") //DEBUG
        let teacherName = GlobalVar.suffix+" "+GlobalVar.lastname;
        teacherNameLabel.text = teacherName;
    }
    
    @IBOutlet weak var trailing: NSLayoutConstraint!
    @IBOutlet weak var leading: NSLayoutConstraint!
    
    @IBAction func TeacherMenuButton(_ sender: Any) {
        
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
    } // TeacherMenuButton
    
    /* DEBUG to complete
    // extract pupil postings from the database and display in the textField
    func displayPupilPostings () {
        
        // sql query to extract all the comments
        let querySQL = "SELECT loginname, activity, comment, date, moodlevel FROM COMMENTS;"
        var results:FMResultSet? = GlobalVar.whatNextDB.executeQuery(querySQL, withArgumentsIn:[]);
        while results?.next()==true {
            print ("comment found");""
            let loginname : String = results?.string(forColumn:"loginname") ?? "";
            let activity : String = results?.string(forColumn:"activity") ?? "";
            let comment : String = results?.string(forColumn:"comment") ?? "";
            let date : String = results?.string(forColumn:"date") ?? "";
            let moodlevel : Int = results?.long(forColumn:"moodlevel") ?? 0;

            // check if the comment is from teacher or pupil
            let querySQL2 = "SELECT suffix, lastname FROM TEACHER WHERE loginname = '\(loginname)';"
            let results2:FMResultSet? = GlobalVar.whatNextDB.executeQuery(querySQL2, withArgumentsIn:[]);
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
                CommentsTextView.insertText ("\n\n"+"Date: "+date);
                CommentsTextView.insertText ("\n\n===========================");
            }
            else {
                // check if the usernane is in pupil table
                
                // pupil comment
                print ("Pupil comment!!")
                let querySQL3 = "SELECT firstname, lastname FROM PUPIL WHERE loginname = '\(loginname)';"

                let results3:FMResultSet? = GlobalVar.whatNextDB.executeQuery(querySQL3, withArgumentsIn:[]);
                if results3?.next()==true {
                    let firstname : String = results3?.string(forColumn:"firstname") ?? "";
                    let lastname : String = results3?.string(forColumn:"lastname") ?? "";
                    // Display on Comments TextView
                    CommentsTextView.insertText ("\n\n");
                    CommentsTextView.insertText (firstname+" "+lastname);
                    CommentsTextView.insertText ("\nPupil");
                    if activity != "" {
                        CommentsTextView.insertText ("\n"+activity);
                    }
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
                    CommentsTextView.insertText ("\n\n"+"Date: "+date);
                    CommentsTextView.insertText ("\n\n===========================");
                } else {
                    // username is not in TEACHER or PUPIL table - report an error
                }
            }

        }
    }  // displayPupilPostings
 DEBUG */
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
