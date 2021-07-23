//
//  MoodViewController.swift
//  What Next
//
//  Created by Chris Thompson on 16/07/2021.
//

import UIKit

class MoodViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print ("In MoodViewController")
        print ("About to performSegue to MoodViewPopupSeque")
        performSegue(withIdentifier:"moodViewPopupSegue",sender:AnyObject.self);

        // Do any additional setup after loading the view.
        
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
