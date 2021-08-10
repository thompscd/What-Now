//
//  UserProfileViewController.swift
//  What Next
//
//  Created by Chris Thompson on 19/07/2021.
//

import UIKit

class UserProfileViewController: UIViewController {

    
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var errorLabel2: UILabel!
    
    let loginname = GlobalVar.loginname;  
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //openDatabase();
        
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
