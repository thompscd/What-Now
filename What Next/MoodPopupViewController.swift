//
//  MoodPopupViewController.swift
//  What Next
//
//  Created by Chris Thompson on 15/07/2021.
//

import UIKit

class MoodPopupViewController: UIViewController {
    
    @IBOutlet weak var happyButton: UIButton!
    @IBOutlet weak var okButton: UIButton!
    @IBOutlet weak var sadButton: UIButton!
    @IBOutlet weak var commentTextField: UITextField!
    
    var moodLevel : Int = 0;   //0=unknown, 1=happy, 2=ok, 3=sad
    

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // happy button pressed so gray out others
    @IBAction func happyButtonPressed(_ sender: Any) {
        moodLevel = 1;
        happyButton.setImage(UIImage(named: "happy face smaller.png"), for: .normal)
        okButton.setImage(UIImage(named: "ok face gray.png"), for: .normal)
        sadButton.setImage(UIImage(named: "sad face gray.png"), for: .normal)
    }
    
    // ok button pressed so gray out others
    @IBAction func okButtonPressed(_ sender: Any) {
        moodLevel = 2;
        okButton.setImage(UIImage(named: "ok face smaller.png"), for: .normal)
        happyButton.setImage(UIImage(named: "happy face gray.png"), for: .normal)
        sadButton.setImage(UIImage(named: "sad face gray.png"), for: .normal)
    }
    
    // sad button pressed so gray out others
    @IBAction func sadButtonPressed(_ sender: Any) {
        moodLevel = 3;
        sadButton.setImage(UIImage(named: "sad face smaller.png"), for: .normal)
        happyButton.setImage(UIImage(named: "happy face gray.png"), for: .normal)
        okButton.setImage(UIImage(named: "ok face gray.png"), for: .normal)
    }
    
    @IBAction func submitButtonPressed(_ sender: Any) {
        
        // THIS IS A HACK. THIS IS CODE COPIED FROM ViewController.swift. NEED TO CHANGE SO THAT THE whatnextDB variable is passed between controllers !!!!!
        var databasePath = String();
        let filemgr = FileManager.default
        let dirPaths = filemgr.urls(for: .documentDirectory,
                       in: .userDomainMask)
        databasePath = dirPaths[0].appendingPathComponent("whatnext.db").path
        let whatnextDB = FMDatabase(path: databasePath as String)
        if whatnextDB == nil {
            print("Error MoodPopupViewController: whatnextDB is nil, \(whatnextDB.lastErrorMessage())")
        } else {
            print ("MoodPopupViewControl: database not nil")
            if (whatnextDB.open()) {
                print ("MoodPopupViewControl: database is open")
            } else {
                print("Error MoodPopupViewController: whatnextDB not open, \(whatnextDB.lastErrorMessage())")
            }
        }
        // END OF HACK CODE !!!!!!!
        /////////////////////////////////////////////////
        
        // add the comment to the database
        print ("MoodPopupViewControl: adding new comment to db")
        
        // format the date & time
        let df = DateFormatter()
        df.dateFormat = "yyyy-MM-dd hh:mm:ss"
        let dateTime = df.string(from: Date())
        print ("date time is ", dateTime)
        
        let comment : String = commentTextField.text ?? "";
        let querySQL = "INSERT INTO COMMENTS (id, loginname, comment, date, liked, moodlevel) VALUES (null,'mikey','\(comment)','\(dateTime)', 1, \(moodLevel));"

        let results = whatnextDB.executeUpdate(querySQL, withArgumentsIn:[]);
        
        // dismiss the pop-up screen
        // dismiss(animated:true,completion:nil)  // update successful so close the screen
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
