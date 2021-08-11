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
        let pupil = extractPupilDetailsfromDB(loginname: loginname);
        if pupil.found {

            // Display current values
            firstnameTextField.text = pupil.firstname
            lastnameTextField.text = pupil.lastname
            
        } else {
            // pupil not in database - display error
        }
        
    }
    
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
