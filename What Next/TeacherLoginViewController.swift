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
        
        let teacher = extractTeacherDetailsfromDB (loginname: username)

        if teacher.found {
            let dbpassword = teacher.password
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
            GlobalVar.loginname = username
            GlobalVar.suffix = teacher.suffix
            GlobalVar.lastname = teacher.lastname
            
            performSegue(withIdentifier:"teacherViewSegue",sender:AnyObject.self);
        }
        
    }
    
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
