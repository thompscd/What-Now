//
//  ActivitySelectionViewController.swift
//  What Next
//
//  Created by Christopher Thompson on 24/07/2021.
//

import UIKit

class ActivitySelectionViewController: UIViewController {
    
    var activityPageTitle:String = ""

    @IBOutlet weak var dayPickActivityTitle: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dayPickActivityTitle?.text = activityPageTitle
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
