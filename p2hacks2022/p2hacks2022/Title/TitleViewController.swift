//
//  TitleViewController.swift
//  p2hacks2022
//
//  Created by 児玉拓海 on 2022/12/12.
//

import UIKit
import SwiftyGif

class TitleViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //スクリーンの幅
        let screenWidth = Float(UIScreen.main.bounds.size.width)
        //スクリーンの高さ
        let screenHeight = Float(UIScreen.main.bounds.size.height)
        let gifManager = SwiftyGifManager(memoryLimit: 20)
        let titleGif = try! UIImage(gifName: "どうあげ 1.gif")
        let imageView = UIImageView(gifImage: titleGif, manager: gifManager)
        imageView.frame = CGRect(x: 0, y: 0, width: Int(screenWidth), height: Int(screenHeight))
        view.addSubview(imageView)
        
        let widthTitleCenter = (screenWidth - 205) / 2
        let screenTapLabel = UILabel()
        screenTapLabel.text = "画面をタップ"
        screenTapLabel.textAlignment = NSTextAlignment.center
        screenTapLabel.textColor = UIColor(hex: "ffffff")
        screenTapLabel.font = UIFont(name: "07NikumaruFont", size: 28)
        screenTapLabel.frame = CGRect(x: Int(widthTitleCenter), y: 563, width: 205, height: 40)
        view.addSubview(screenTapLabel)
        
        let titleLogo = try! UIImage(imageName: "ロゴ.png")
        let titleLogoView = UIImageView(image: titleLogo)
        let widthTitleLogoCenter = (screenWidth - 340) / 2
        titleLogoView.frame = CGRect(x: Int(widthTitleLogoCenter), y: 50, width: 340, height: 167)
        view.addSubview(titleLogoView)
    }
    @IBAction func tapScreen(_ sender: Any) {
        let storyboard = UIStoryboard(name: "AgeruSet", bundle: nil)
        let start = storyboard.instantiateViewController(withIdentifier: "privateage") as! AgeruSetController
        start.modalTransitionStyle = .crossDissolve
        start.modalPresentationStyle = .fullScreen
        self.present(start, animated: true, completion: nil)
    }
}
