//
//  SentenceCreatorActivityViewController.swift
//  What Next
//
//  Created by Christopher Thompson on 30/07/2021.
//

import UIKit

class SentenceCreatorActivityViewController: UIViewController {
    
    @IBOutlet weak var canvasView: CanvasView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onClickSave(_ sender: UIButton) {
        let image = canvasView.takeScreenShot()
        UIImageWriteToSavedPhotosAlbum(image, self, #selector(imageSaved(_:didFinishSavingWithError:contextType:)), nil)
        self.showToast(message: "Screenshot Taken!", seconds: 2.0)
    }
    
    @objc func imageSaved(_ image: UIImage, didFinishSavingWithError error: Error?, contextType: UnsafeRawPointer) {
        if error != nil {
            print("Unable to save the image into the photos.")
        } else {
            print("Image saved to photos!")
        }
    }
    
}

extension SentenceCreatorActivityViewController{

func showToast(message : String, seconds: Double){
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alert.view.backgroundColor = .black
        alert.view.alpha = 0.5
        alert.view.layer.cornerRadius = 15
        self.present(alert, animated: true)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + seconds) {
            alert.dismiss(animated: true)
        }
    }
 }
