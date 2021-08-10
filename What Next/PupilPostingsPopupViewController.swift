//
//  PupilPostingsPopupViewController.swift
//  What Next
//
//  Created by Chris Thompson on 09/08/2021.
//

import UIKit

class PupilPostingsPopupViewController: UIViewController {

    @IBOutlet weak var UsernameTextField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        UsernameTextField.becomeFirstResponder()

    }
    
    @IBAction func submitButtonPressed(_ sender: Any) {
        
        // clear any error messages
        errorLabel.text = "";

        var error_found = false ;
        
        // check that pupil name is not empty
        let pupilUserName : String = UsernameTextField.text ?? "";
        if pupilUserName == "" {
            errorLabel.text = "Error: pupil username cannot be empty"
            error_found = true;
        }
        
        // check that the pupil is in the database
        if !error_found {
            let querySQL = "SELECT firstname, lastname, password FROM PUPIL WHERE loginname = '\(pupilUserName.lowercased())';"

            let results:FMResultSet? = GlobalVar.whatNextDB.executeQuery(querySQL, withArgumentsIn:[]);
            if results?.next()==true {
                GlobalVar.pupilPostingsUsername = pupilUserName;
            } else {
                errorLabel.text = "Error: pupil does not exist"
                error_found = true;
            }
        }
        
        
        // add notification to database
        if !error_found {
            
            // return to teacher home screen
            //dismiss(animated:true,completion:nil)  // update successful so close the screen
            performSegue(withIdentifier:"PupilPostingsSegue",sender:AnyObject.self);

        }
        
    } //submitButtonPressed
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
