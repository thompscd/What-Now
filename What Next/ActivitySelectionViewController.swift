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
    @IBAction func returnToPreviousScreen(_ sender: UIButton) {
        performSegueToReturnBack()
    }
    
}

extension UIViewController {
    func performSegueToReturnBack()  {
        if let nav = self.navigationController {
            nav.popViewController(animated: true)
        } else {
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    
}
