//
//  TeacherLoginViewController.swift
//  What Next
//
//  Created by Chris Thompson on 07/07/2021.
//

import UIKit

class TeacherLoginViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var LoginErrorLabel: UILabel!
    @IBOutlet weak var UserNameTextField: UITextField!
    @IBOutlet weak var PasswordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // needed so that keyboard on ipad/iphone disappears on return key
        self.UserNameTextField.delegate = self;
        self.PasswordTextField.delegate = self;
        
    }
    
    // needed so that keyboard on ipad/iphone disappears on return key
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    @IBAction func close () {
        dismiss (animated:true, completion: nil)
    }

    @IBAction func SignInButtonPressed(_ sender: Any) {
        let username: String = UserNameTextField.text ?? "";
        let password: String = PasswordTextField.text ?? "";
        let login_error_message = "Unknown User - please try again!";
        let password_error_message = "Invalid password - please try again!";
        
        var validLoginDetails : Bool = true;

        LoginErrorLabel.text = ""; // clear any old error messages

        
        // check if this username exists in database

        // return password for that teacher (if it exists)
        let querySQL = "SELECT loginname, suffix, firstname, lastname, password, email FROM TEACHER WHERE loginname = '\(username.lowercased())';"

        let results:FMResultSet? = GlobalVar.whatNextDB.executeQuery(querySQL, withArgumentsIn:[]);
        if results?.next()==true {
            let dbpassword = results?.string(forColumn:"password");
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
            LoginErrorLabel.text = login_error_message;
            PasswordTextField.text = "";  // clear the password
            UserNameTextField.text = "";  // clear the user name
            // move cursor back to username
            UserNameTextField.becomeFirstResponder();
            let desiredPosition = UserNameTextField.beginningOfDocument;
            validLoginDetails = false;
        }
        
        // if login ok then open TeacherViewController
        if validLoginDetails {
            //save the teacher details for other View Controllers to use
            GlobalVar.loginname = username;
            let suffix = results?.string(forColumn:"suffix");
            GlobalVar.suffix = suffix ?? "";
            let lastname = results?.string(forColumn:"lastname");
            GlobalVar.lastname = lastname ?? "";
            
            performSegue(withIdentifier:"teacherViewSegue",sender:AnyObject.self);
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
