//
//  TeacherViewController.swift
//  What Next
//
//  Created by Chris Thompson on 24/07/2021.
//

import UIKit

class TeacherViewController: UIViewController {
    @IBOutlet weak var teacherNameLabel: UILabel!
    @IBOutlet weak var pupilPostingsTextView: UITextView!
    @IBOutlet weak var pupilPostingsLabel: UILabel!
    var menuOut = false;
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // add teacher name to the screen
        let teacherName = GlobalVar.suffix+" "+GlobalVar.lastname;
        teacherNameLabel.text = teacherName;
        
        displayPupilPostings ();
    }
    
    @IBOutlet weak var trailing: NSLayoutConstraint!
    @IBOutlet weak var leading: NSLayoutConstraint!
    
    @IBAction func TeacherMenuButton(_ sender: Any) {
        
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
        }
    } // TeacherMenuButton
    
    // extract pupil postings from the database and display in the textField
    func displayPupilPostings () {
        
        if GlobalVar.pupilPostingsUsername != "" {
            
            // update title label to add pupil username
            var updateTitle :String = "";
            updateTitle = pupilPostingsLabel.text ?? ""
            updateTitle = updateTitle + " - " + GlobalVar.pupilPostingsUsername
            pupilPostingsLabel.text = updateTitle;
            
            // sql query to extract all the comments for chosen pupil
            let querySQL = "SELECT loginname, recipient, activity, comment, date, moodlevel FROM COMMENTS WHERE recipient = '\(GlobalVar.pupilPostingsUsername)';"
            var results:FMResultSet? = GlobalVar.whatNextDB.executeQuery(querySQL, withArgumentsIn:[]);
            while results?.next()==true {
                let loginname : String = results?.string(forColumn:"loginname") ?? "";
                let activity : String = results?.string(forColumn:"activity") ?? "";
                let comment : String = results?.string(forColumn:"comment") ?? "";
                let date : String = results?.string(forColumn:"date") ?? "";
                let moodlevel : Int = results?.long(forColumn:"moodlevel") ?? 0;

                // check if the comment is from teacher or pupil
                let teacher = extractTeacherDetailsfromDB(loginname: loginname)
                // let querySQL2 = "SELECT suffix, lastname FROM TEACHER WHERE loginname = '\(loginname)';"
                //let results2:FMResultSet? = GlobalVar.whatNextDB.executeQuery(querySQL2, withArgumentsIn:[]);
                if teacher.found {
                    // teacher comment
                    let suffix : String = teacher.suffix
                    let lastname : String = teacher.lastname
                    // Display on Comments TextView
                    pupilPostingsTextView.insertText ("\n"+suffix+" "+lastname);
                    pupilPostingsTextView.insertText ("\nClassroom Teacher");
                    pupilPostingsTextView.insertText ("\n\n"+"\""+comment+"\"");
                    pupilPostingsTextView.insertText ("\n\n"+"Date: "+date);
                    pupilPostingsTextView.insertText ("\n\n===========================\n");
                }
                else {
                    // check if the username is in pupil table
                    let pupil = extractPupilDetailsfromDB(loginname: loginname)
                    if pupil.found {
                        let firstname : String = pupil.firstname
                        let lastname : String = pupil.lastname
                        // Display on Comments TextView
                        pupilPostingsTextView.insertText ("\n"+firstname+" "+lastname);
                        pupilPostingsTextView.insertText ("\nPupil");
                        if activity != "" {
                            pupilPostingsTextView.insertText ("\n"+activity);
                        }
                        pupilPostingsTextView.insertText ("\n\n"+"\""+comment+"\"");

                        if (moodlevel == GlobalVar.moodlevel_none) {
                            // ignore - no mood level selected by the pupil
                        } else if (moodlevel == GlobalVar.moodlevel_happy) {
                            // Happy
                            pupilPostingsTextView.insertText ("\n\nMood level : Happy");
                        } else if (moodlevel == GlobalVar.moodlevel_ok) {
                            // ok
                            pupilPostingsTextView.insertText ("\n\nMood level : ok");
                        } else if (moodlevel == GlobalVar.moodlevel_sad) {
                            // sad
                            pupilPostingsTextView.insertText ("\n\nMood level : sad");
                        }
                        pupilPostingsTextView.insertText ("\n"+"Date: "+date);
                        pupilPostingsTextView.insertText ("\n\n===========================\n");
                    } else {
                        // username is not in TEACHER or PUPIL table - report an error
                    }
                }
            }
        } // pupil name had been specified by teacher

    }  // displayPupilPostings
    
    func extractPupilDetailsfromDB (loginname : String) -> (found : Bool, firstname : String, lastname : String, password : String) {
        
        // check the user is in the database
        let querySQL = "SELECT firstname, lastname, password FROM PUPIL WHERE loginname = '\(loginname)';"
        //let results:FMResultSet? = GlobalVar.whatNextDB.executeQuery(querySQL, withArgumentsIn:[]);
        let results = GlobalVar.whatNextDB.executeQuery(querySQL, withArgumentsIn:[]);
        if results?.next()==true {
            let firstname : String = results?.string(forColumn:"firstname") ?? ""
            let surname : String = results?.string(forColumn:"lastname") ?? ""
            let password : String = results?.string(forColumn: "password") ?? ""
            return (true, firstname, surname, password)
        } else {
            return (false,"","","")
        }
    } //extractPupilDetailsfromDB
    
    // returns teacher details from the database
    func extractTeacherDetailsfromDB (loginname : String) -> (found : Bool, suffix : String, lastname : String, password : String) {
        
        // check the teacher is in the database
        let querySQL = "SELECT suffix, lastname, password FROM TEACHER WHERE loginname = '\(loginname.lowercased())';"
        let results = GlobalVar.whatNextDB.executeQuery(querySQL, withArgumentsIn:[]);
        if results?.next()==true {
            let suffix : String = results?.string(forColumn: "suffix") ?? ""
            let lastname : String = results?.string(forColumn: "lastname") ?? ""
            let password : String = results?.string(forColumn: "password") ?? ""
            return (true, suffix, lastname, password)
        } else {
            return (false,"","","")
        }
    } //extractTeacherDetailsfromDB
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
