//
//  BackwordsWordsActivityViewController.swift
//  What Next
//
//  Created by Christopher Thompson on 29/07/2021.
//

import UIKit

class BackwordsWordsActivityViewController: UIViewController {

    @IBOutlet weak var timerLabel: UILabel!
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var canvasView: CanvasView!
    
    // Colours for whiteboard collection view.
    var items: [UIColor] = [#colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1), #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1), #colorLiteral(red: 1, green: 0.4059419876, blue: 0.2455089305, alpha: 1), #colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1), #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1), #colorLiteral(red: 1, green: 0.4059419876, blue: 0.2455089305, alpha: 1), #colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1), #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1), #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1), #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1), #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1), #colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1), #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), #colorLiteral(red: 0.3176470697, green: 0.07450980693, blue: 0.02745098062, alpha: 1), #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1), #colorLiteral(red: 0.3823936913, green: 0.8900789089, blue: 1, alpha: 1), #colorLiteral(red: 1, green: 0.4528176247, blue: 0.4432695911, alpha: 1), #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1), #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)]
    
    // Formatting for timer.
    var countdownTimer: Timer!
    var totalTime = 600
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self

        // Do any additional setup after loading the view.
        
        // update the activity reflection
        GlobalVar.activityRefelection = "Backwards Words Activity Reflection"
    }
    
    @IBAction func onClickSave(_ sender: UIButton) {
        let image = canvasView.takeScreenShot()
        UIImageWriteToSavedPhotosAlbum(image, self, #selector(imageSaved(_:didFinishSavingWithError:contextType:)), nil)
    }
    
    @objc func imageSaved(_ image: UIImage, didFinishSavingWithError error: Error?, contextType: UnsafeRawPointer) {
        if error != nil {
            print("Unable to save the image into the photos.")
        } else {
            print("Image saved to photos!")
        }
    }
    
    @IBAction func onClickUndo(_ sender: UIButton) {
        canvasView.undoDraw()
    }
    
    @IBAction func onClickClear(_ sender: UIButton) {
        canvasView.clearCanvasView()
    }
    
    @IBAction func onClickBrushSize(_ sender: UISlider) {
        canvasView.strokeWidth = CGFloat(sender.value)
    }
    
    @IBAction func onClickOpacity(_ sender: UISlider) {
        canvasView.strokerOpacity = CGFloat(sender.value)
    }
    
    //Timer Functions
    func startTimer() {
        countdownTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
    }

    @objc func updateTime() {
        timerLabel.text = "\(timeFormatted(totalTime))"
        
        if totalTime != 0 {
            totalTime -= 1
        } else {
            endTimer()
            totalTime = 600
            canvasView.isUserInteractionEnabled = false
        }
    }
    
    func endTimer() {
        countdownTimer.invalidate()
    }
    
    func timeFormatted(_ totalSeconds: Int) -> String {
        let seconds: Int = totalSeconds % 60
        let minutes: Int = (totalSeconds / 60) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
    
    @IBAction func onClickStartCountdown(_ sender: UIButton) {
        startTimer()
        canvasView.isUserInteractionEnabled = true
    }
    
    //Using previous segue to return to previous screen when return pressed.
    @IBAction func returnToPreviousScreen(_ sender: UIButton) {
        performSegueToReturnBack()
    }
    

}

extension BackwordsWordsActivityViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        if let backView = cell.viewWithTag(111) as? UIView {
            backView.backgroundColor = items[indexPath.row]
            backView.layer.cornerRadius = 3
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        canvasView.strokerColor = items[indexPath.row]
    }
        
}
