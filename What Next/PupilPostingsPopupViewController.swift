//
//  PupilPostingsPopupViewController.swift
//  What Next
//
//  Created by Andy Thompson on 09/08/2021.
//

import UIKit

class PupilPostingsPopupViewController: UIViewController {

    @IBOutlet weak var UsernameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        UsernameTextField.becomeFirstResponder()

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
