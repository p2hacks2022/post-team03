//
//  ResultViewController.swift
//  p2hacks2022
//
//  Created by 児玉拓海 on 2022/12/18.
//

import UIKit

class ResultViewController: UIViewController {
    var roomName = ""
    
    @IBOutlet weak var popUp: UIView!
    @IBOutlet weak var roomTitle: UILabel!
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .landscapeRight
    }
    override var shouldAutorotate: Bool {
        return false
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        //スクリーンの幅
        let screenWidth = Float(UIScreen.main.bounds.size.width)
        //スクリーンの高さ
        let screenHeight = Float(UIScreen.main.bounds.size.height)
        roomTitle.text = "「"+roomName+"」"
        popUp.frame = CGRect(x: Int((screenWidth - 335)/2), y: Int((screenHeight-350)/2), width: 335, height: 350)
        popUp.layer.cornerRadius = 10
        view.addSubview(popUp)
    }
    
    @IBAction func taisyutuButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "AgeruSet", bundle: nil)
        let selectTabViewA = storyboard.instantiateViewController(withIdentifier: "privateage") as! AgeruSetController
        selectTabViewA.modalTransitionStyle = .crossDissolve
        selectTabViewA.modalPresentationStyle = .fullScreen
        self.present(selectTabViewA, animated: true, completion: nil)
    }
}
