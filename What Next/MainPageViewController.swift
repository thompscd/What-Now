//
//  MainPageViewController.swift
//  What Next
//
//  Created by Chris Thompson on 08/07/2021.
//

import UIKit

class MainPageViewController: UIViewController, UITextFieldDelegate, UISearchBarDelegate {

    @IBOutlet weak var notificationButton: UIButton!
    @IBOutlet weak var leading: NSLayoutConstraint!
    @IBOutlet weak var trailing: NSLayoutConstraint!
    
    @IBOutlet weak var CommentsTextView: UITextView!
    
    @IBOutlet weak var searchTextView: UISearchBar!
    
    var menuOut = false;

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // needed so that keyboard on ipad/iphone disappears on return key
        self.searchTextView.delegate = self;
        
        displayComments()
        grayOutNotificationButton ()
        displayUnreadNotificationsPopup()
        
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
    
    // if there are no unread notifications then gray out the button 
    func grayOutNotificationButton () {
        let querySQL = "SELECT id, pupilloginname, teacherloginname, notification, datesubmitted, dateread, priority FROM NOTIFICATIONS WHERE pupilloginname = '\(GlobalVar.loginname)' AND dateread = '';"
        let results = GlobalVar.whatNextDB.executeQuery(querySQL, withArgumentsIn:[])! ;
        if results.next() != true  {
            //no unread notification so gray out the notification button
            notificationButton.isEnabled = false
            notificationButton.setTitleColor(UIColor.gray, for: .disabled)
        }
    }
    

    
    // extract comments from the database and display in the textField
    func displayComments () {
        
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
    }  // displayComments
    
    // display popup if there are any unread notifications
    func displayUnreadNotificationsPopup () {
        var unreadNotificationCount : Int = 0;
        if !GlobalVar.unreadNotificationsPopupDisplayed {
            GlobalVar.unreadNotificationsPopupDisplayed = true;
            // check if any unread notifications
            let querySQL = "SELECT dateread FROM NOTIFICATIONS WHERE pupilloginname = '\(GlobalVar.loginname)';"
            var results:FMResultSet? = GlobalVar.whatNextDB.executeQuery(querySQL, withArgumentsIn:[]);

            while results?.next()==true {
                if results?.string(forColumn:"dateread") ?? "" == "" {
                    unreadNotificationCount += 1;
                }
            }
            print ("unreadNotificationCount = ",unreadNotificationCount)
            if unreadNotificationCount > 0 {
                performSegue(withIdentifier:"unreadNotificationPopup",sender:AnyObject.self);
            }
            else {
                // gray out the notification button
                notificationButton.isEnabled = false
                notificationButton.setTitleColor(UIColor.gray, for: .disabled)
            }
        }
        
    } // displayUnreadNotificationsPopup
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
