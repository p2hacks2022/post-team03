//
//  ResultViewController.swift
//  p2hacks2022
//
//  Created by 児玉拓海 on 2022/12/18.
//

import UIKit

class ResultViewController: UIViewController {
    var roomName = ""
    @IBOutlet weak var karaage: UIImageView!
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
        roomTitle.font = UIFont(name: "07NikumaruFont", size: 35)
        popUp.frame = CGRect(x: Int((screenWidth - 335)/2), y: Int((screenHeight-350)/2), width: 335, height: 350)
        popUp.layer.cornerRadius = 10
        karaage.frame = CGRect(x: Int((screenWidth-275)/2), y: Int((screenHeight-160)/2), width: 275, height: 160)
        view.addSubview(popUp)
        view.addSubview(karaage)
    }
    
    @IBAction func taisyutuButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "finGif", bundle: nil)
        let selectTabViewA = storyboard.instantiateViewController(withIdentifier: "fingif") as! finGifViewController
        selectTabViewA.modalTransitionStyle = .crossDissolve
        selectTabViewA.modalPresentationStyle = .fullScreen
        self.present(selectTabViewA, animated: true, completion: nil)
    }
}
