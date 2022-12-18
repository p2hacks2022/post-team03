//
//  SetUpGifViewController.swift
//  p2hacks2022
//
//  Created by 児玉拓海 on 2022/12/18.
//

import UIKit
import SwiftyGif

class SetUpGifViewController: UIViewController {
        
    var roomName = ""
    var id = 0

    override var shouldAutorotate: Bool {
        return false
    }
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        //スクリーンの幅
        let screenWidth = Float(UIScreen.main.bounds.size.width)
        //スクリーンの高さ
        let screenHeight = Float(UIScreen.main.bounds.size.height)
        let gifManager = SwiftyGifManager(memoryLimit: 20)
        let setupGif = try! UIImage(gifName: "横持ちロード.gif")
        let imageView = UIImageView(gifImage: setupGif, manager: gifManager)
        imageView.frame = CGRect(x: 0, y: 0, width: Int(screenWidth), height: Int(screenHeight))
        view.addSubview(imageView)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.2) {
            let storyboard = UIStoryboard(name: "Ageru", bundle: nil)
            let letsgo = storyboard.instantiateViewController(withIdentifier: "ageru") as!AgeruViewController
            letsgo.modalTransitionStyle = .crossDissolve
            letsgo.modalPresentationStyle = .fullScreen
            letsgo.id = self.id
            letsgo.roomName = self.roomName
            self.present(letsgo, animated: true, completion: nil)
        }
    }
}
