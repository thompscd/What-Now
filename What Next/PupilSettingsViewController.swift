//
//  PupilSettingsViewController.swift
//  What Next
//
//  Created by Chris Thompson on 23/07/2021.
//

import UIKit

class PupilSettingsViewController: UIViewController {
    
    @IBOutlet weak var firstnameTextField: UITextField!
    @IBOutlet weak var lastnameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    
    @IBOutlet weak var errorLabel: UILabel!
    
    let loginname = GlobalVar.loginname;
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //openDatabase();
        
        // extract username details from database and add to the fields
        
        // check the user is in the database
        let querySQL = "SELECT firstname, lastname, password FROM PUPIL WHERE loginname = '\(loginname)';"
        let results:FMResultSet? = GlobalVar.whatNextDB.executeQuery(querySQL, withArgumentsIn:[]);
        if results?.next()==true {
            print("UserProfileViewController - user is in database !!!!")
            let firstname = results?.string(forColumn:"firstname") ;
            let lastname = results?.string(forColumn:"lastname");
            let password = results?.string(forColumn:"password");
            print ("firstname = ", firstname ?? "");
            print ("lastname = ", lastname ?? "");
            print ("password = ", password ?? "");

            // Display current values
            firstnameTextField.text = firstname ?? "";
            lastnameTextField.text = lastname;

            
        } else {
            // pupil not in database - display error
            print("UserProfileViewController - user not in database !!!!")
        }
        
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
        
        // check the password is not empty
        let password : String = passwordTextField.text ?? "";
        if !error_found {
            if password == "" {
                errorLabel.text = "Error: password cannot be empty"
                error_found = true;
            }
        }

        // check the password matches confirm
        // password
        let confirmPassword : String = confirmPasswordTextField.text ?? "";
        if !error_found {
            if password != confirmPassword {
                errorLabel.text = "Error: confirm password incorrect"
                error_found = true;
            }
        }
        
        if !error_found {
            // update database with new values
            let querySQL = "UPDATE PUPIL SET firstname='\(firstname ?? "")', lastname='\(lastname)', password='\(password)' WHERE loginname = '\(loginname)';"
            let results = GlobalVar.whatNextDB.executeUpdate(querySQL, withArgumentsIn:[]);
            dismiss(animated:true,completion:nil)  // update successful so close the screen

        }
    }
    

    @IBAction func backButtonPressed(_ sender: Any) {
        dismiss(animated:true,completion:nil)
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
