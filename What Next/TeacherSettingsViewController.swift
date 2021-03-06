//
//  TeacherSettingsViewController.swift
//  What Next
//
//  Created by Chris Thompson on 28/07/2021.
//

import UIKit

class TeacherSettingsViewController: UIViewController, UITextFieldDelegate {
    

    @IBOutlet weak var firstnameTextField: UITextField!
    @IBOutlet weak var lastnameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    // suffix pulldown outlets
    @IBOutlet weak var suffixSelectBtn: UIButton!
    @IBOutlet var suffixPulldownOptions: [UIButton]!
    
    
    @IBOutlet weak var errorLabel: UILabel!
        
    let loginname = GlobalVar.loginname;
    var currentPasswordInDatabase : String = "";
    var suffixSelected : String = "";
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.firstnameTextField.delegate = self;
        self.lastnameTextField.delegate = self;
        self.emailTextField.delegate = self;
        self.passwordTextField.delegate = self;
        self.confirmPasswordTextField.delegate = self;
        
        // Do any additional setup after loading the view.
                
        hideSuffixPulldown();
        
        // extract username details from database and add to the fields
        
        // check the teacher is in the database
        let querySQL = "SELECT suffix, firstname, lastname, password, email FROM TEACHER WHERE loginname = '\(loginname)';"
        let results:FMResultSet? = GlobalVar.whatNextDB.executeQuery(querySQL, withArgumentsIn:[]);
        if results?.next()==true {
            let suffix :String = results?.string(forColumn:"suffix") ?? "" ;
            suffixSelected = suffix;
            let firstname = results?.string(forColumn:"firstname") ;
            let lastname = results?.string(forColumn:"lastname");
            let password = results?.string(forColumn:"password");
            currentPasswordInDatabase = password ?? "";
            let email = results?.string(forColumn:"email");

            // Display current values
            //suffixTextField.text = suffix ?? "";
            firstnameTextField.text = firstname ?? "";
            lastnameTextField.text = lastname;
            emailTextField.text = email;
            suffixSelectBtn.setTitle(suffix, for: .normal);


        } else {
            // teacher not in database - display error
        }
        
    }
    
    // needed so that keyboard on ipad/iphone disappears on return key
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    @IBAction func updateButtonPressed(_ sender: Any) {
    
        // clear any error messages
        errorLabel.text = ""

        var error_found = false ;
                
        // check that First Name is not empty
        let firstname = firstnameTextField.text;
        if firstname == "" {
            errorLabel.text = "Error: first name cannot be empty"
            error_found = true;
        }
        
        // check that Last Name is not empty
        let lastname : String = lastnameTextField.text ?? "";
        if !error_found {
            if lastname == "" {
                errorLabel.text = "Error: last name cannot be empty"
                error_found = true;
            }
        }
        
        // check the email address is not empty
        let email : String = emailTextField.text ?? "";
        if !error_found {
            if email == "" {
                errorLabel.text = "Error: email cannot be empty"
                error_found = true;
            } else if !email.isValidEmail {
                errorLabel.text = "Error: invalid email address format"
                error_found = true;
            }
        }

        // check the password matches confirm password
        var password : String = passwordTextField.text ?? "";
        let confirmPassword : String = confirmPasswordTextField.text ?? "";
        if !error_found {
            if password != confirmPassword {
                errorLabel.text = "Error: confirm password incorrect"
                error_found = true;
            }
        }
        
        // update database with new values
        if !error_found {
            if password == "" {
                //user did not enter password so set to current value
                password = currentPasswordInDatabase;
            }
            let querySQL = "UPDATE TEACHER SET firstname='\(firstname ?? "")', lastname='\(lastname)', password='\(password)', email='\(email)', suffix='\(suffixSelected)' WHERE loginname = '\(loginname)';"
            let results = GlobalVar.whatNextDB.executeUpdate(querySQL, withArgumentsIn:[]);
            GlobalVar.suffix = suffixSelected;
            //dismiss(animated:true,completion:nil)  // update successful so close the screen
            performSegue(withIdentifier:"teacherSegue",sender:AnyObject.self);

        }
    }
    

    @IBAction func backButtonPressed(_ sender: Any) {
        
        //dismiss(animated:true,completion:nil)
        performSegue(withIdentifier:"teacherSegue",sender:AnyObject.self);

    }
    

    
    // suffix pulldown functions

    @IBAction func suffixSelectButtonPressed(_ sender: UIButton) {
        suffixPulldownOptions.forEach { (suffixBtn) in
            UIView.animate(withDuration: 0.2, animations: {
                suffixBtn.isHidden = !suffixBtn.isHidden;
                self.view.layoutIfNeeded()
            })
        }
    } //suffixSelectButtonPressed
    
    // REMOVE OUTLET AND DELETE  !!!!!!!!
    @IBAction func suffixPressed(_ sender: UIButton) {
    }
    
    
    @IBAction func suffixButtonPressed(_ sender: UIButton) {
        if let suffixLabel = sender.titleLabel?.text {
            // bring dropdown back up
            suffixPulldownOptions.forEach { (suffixBtn) in
                UIView.animate(withDuration: 0.2, animations: {
                    suffixBtn.isHidden = !suffixBtn.isHidden;
                    self.view.layoutIfNeeded()
                })
            }
            // assign priority chosen to label
            suffixSelectBtn.setTitle(suffixLabel, for: .normal);
            suffixSelected = suffixLabel; // save so that can be saved in database
        }
    } //suffixButtonPressed
    
    
    // REMOVE OUTLET AND DELETE  !!!!!!!!
    @IBAction func suffixSelectionPressed(_ sender: Any) {
    }
    
    func hideSuffixPulldown () {
        suffixPulldownOptions.forEach { (suffixBtn) in
            suffixBtn.isHidden = true;
        }
    } // hideSuffixPulldown
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}

// checks if string is a valid format for a email
extension String {
    var isValidEmail: Bool {
        NSPredicate(format: "SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}").evaluate(with: self)
    }
}
