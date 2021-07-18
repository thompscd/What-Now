//
//  PupilLoginViewController.swift
//  What Next
//
//  Created by Chris Thompson on 04/07/2021.
//

import UIKit

class PupilLoginViewController: UIViewController {

    @IBOutlet weak var LoginErrorLabel: UILabel!
    @IBOutlet weak var UserNameTextField: UITextField!
    @IBOutlet weak var PasswordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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

        
        LoginErrorLabel.text = ""; // clear any old error messages

        print ("Sign In button pressed!")
        print ("UserNameTextField is ",username )
        print ("PasswordTextField is ",password )
        // check if this username exists in database
        //////////////////////////////////////////
        // THIS IS A HACK. THIS IS CODE COPIED FROM ViewController.swift. NEED TO CHANGE SO THAT THE whatnextDB variable is passed between controllers !!!!!
        var databasePath = String();
        let filemgr = FileManager.default
        let dirPaths = filemgr.urls(for: .documentDirectory,
                       in: .userDomainMask)
        databasePath = dirPaths[0].appendingPathComponent("whatnext.db").path
        let whatnextDB = FMDatabase(path: databasePath as String)
        if whatnextDB == nil {
            print("Error PupilLoginViewController: whatnextDB is nil, \(whatnextDB.lastErrorMessage())")
        } else {
            print ("PupilLoginViewControl: database not nil")
            if (whatnextDB.open()) {
                print ("PupilLoginViewControl: database is open")
            } else {
                print("Error PupilLoginViewController: whatnextDB not open, \(whatnextDB.lastErrorMessage())")
            }
        }
        // END OF HACK CODE !!!!!!!
        /////////////////////////////////////////////////
        // return password for that pupil (if it exists)
        // let querySQL = "SELECT password FROM PUPIL WHERE loginname=\""+user+"\";";
        //let querySQL = "SELECT password FROM PUPIL;";
        let querySQL = "SELECT loginname, firstname, lastname, lastlogin, password FROM PUPIL WHERE loginname = '\(username.lowercased())';"

        print (querySQL)
        let results:FMResultSet? = whatnextDB.executeQuery(querySQL, withArgumentsIn:[]);
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
            }
            
        } else {
            print ("Pupil not in database!");
            LoginErrorLabel.text = login_error_message;
            PasswordTextField.text = "";  // clear the password
            UserNameTextField.text = "";  // clear the user name
            // move cursor back to username
            UserNameTextField.becomeFirstResponder();
            let desiredPosition = UserNameTextField.beginningOfDocument;
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
