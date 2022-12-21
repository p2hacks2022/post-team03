//
//  finGifViewController.swift
//  p2hacks2022
//
//  Created by 児玉拓海 on 2022/12/18.
//

import UIKit
import SwiftyGif

class finGifViewController: UIViewController {
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
        let setupGif = try! UIImage(gifName: "縦持ちロード1.gif")
        let imageView = UIImageView(gifImage: setupGif, manager: gifManager)
        imageView.frame = CGRect(x: 0, y: 0, width: Int(screenHeight), height: Int(screenWidth))
        view.addSubview(imageView)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
            let storyboard = UIStoryboard(name: "AgeruSet", bundle: nil)
            let letsgo = storyboard.instantiateViewController(withIdentifier: "privateage") as! AgeruSetController
            letsgo.modalTransitionStyle = .crossDissolve
            letsgo.modalPresentationStyle = .fullScreen
            self.present(letsgo, animated: true, completion: nil)
        }
    }
}
