//
//  PupilLoginViewController.swift
//  What Next
//
//  Created by Chris Thompson on 04/07/2021.
//

import UIKit

class PupilLoginViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var LoginErrorLabel: UILabel!
    @IBOutlet weak var UserNameTextField: UITextField!
    @IBOutlet weak var PasswordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
            
        // needed so that keyboard on ipad/iphone disappears on return key
        self.UserNameTextField.delegate = self;
        self.UserNameTextField.delegate = self;

        //DEBUG
        if (GlobalVar.whatNextDB.open()) {
            print ("!!!!!!!!! Database is open")
        } else {
            print ("!!!!!!! Database is NOT open")
        }
    }

    // needed so that keyboard on ipad/iphone disappears on return key
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    // action when the back arrow is pressed
    @IBAction func close () {
        dismiss(animated:true,completion:nil)
    }
    
    @IBAction func SignInButtonPressed(_ sender: Any) {
        let username: String = UserNameTextField.text ?? "";
        let password: String = PasswordTextField.text ?? "";
        let login_error_message = "Unknown User - please try again!";
        let password_error_message = "Invalid password - please try again!";

        var validLoginDetails : Bool = true;
        
        LoginErrorLabel.text = ""; // clear any old error messages

        print ("Sign In button pressed!")
        print ("UserNameTextField is ",username )
        print ("PasswordTextField is ",password )
        // check if this username exists in database

        // return password for that pupil (if it exists)
        let querySQL = "SELECT loginname, firstname, lastname, lastlogin, password FROM PUPIL WHERE loginname = '\(username.lowercased())';"

        let results:FMResultSet? = GlobalVar.whatNextDB.executeQuery(querySQL, withArgumentsIn:[]);
        if results?.next()==true {
            print ("going through results!!!!!!!!")
            let dbpassword = results?.string(forColumn:"password");
            print ("Password for ",username," is ",dbpassword!);
            // check password is correct
            if dbpassword != PasswordTextField.text {
                LoginErrorLabel.text = password_error_message;
                PasswordTextField.text = "";  // clear the password
                UserNameTextField.text = "";  // clear the user name
                // move cursor back to username
                UserNameTextField.becomeFirstResponder();
                let desiredPosition = UserNameTextField.beginningOfDocument;
                validLoginDetails = false;
            }
            
        } else {
            print ("Pupil not in database!");
            LoginErrorLabel.text = login_error_message;
            PasswordTextField.text = "";  // clear the password
            UserNameTextField.text = "";  // clear the user name
            // move cursor back to username
            UserNameTextField.becomeFirstResponder();
            let desiredPosition = UserNameTextField.beginningOfDocument;
            validLoginDetails = false;
        }
        
        // if login ok then open MoodViewController
        if validLoginDetails {
            GlobalVar.loginname = username;  //save the loginname for other View Controllers to use
            print ("about to jump to Mood View Controller ");
            performSegue(withIdentifier:"moodPopupSeque",sender:AnyObject.self);
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
