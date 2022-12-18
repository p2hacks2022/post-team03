//
//  AgaruViewController.swift
//  p2hacks2022
//
//  Created by captain_Taniguchi on 2022/12/18.
//

import UIKit
import SwiftyGif

class AgaruViewController: UIViewController {
    @IBOutlet weak var RoomSelectTitle: UILabel!
    @IBOutlet weak var BackButton: UIButton!
    @IBOutlet weak var shareButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        //スクリーンの幅
        let screenWidth = Float(UIScreen.main.bounds.size.width)
        //スクリーンの高さ
        let screenHeight = Float(UIScreen.main.bounds.size.height)
        let gifManager = SwiftyGifManager(memoryLimit: 20)
        let agerareruGif = try! UIImage(gifName:"アガる 1.gif")
        let imageView = UIImageView(gifImage:agerareruGif,manager:gifManager)
        imageView.frame = CGRect(x: 0, y: 0, width: Int(screenWidth), height: Int(screenHeight))
        view.addSubview(imageView)
        
        let widthTitleCenter = (screenWidth-250) / 2
        let screenTapLabel = UILabel()
        
        RoomSelectTitle.frame = CGRect(x: Int(widthTitleCenter), y: 83, width: Int(widthTitleCenter), height: 70)
        RoomSelectTitle.font = UIFont(name: "07NikumaruFont", size: 27)
        BackButton.frame = CGRect(x: 25, y: 83, width: 65, height: 65)
        shareButton.frame = CGRect(x: 310, y: 83, width: 65, height: 65)
        
        
        screenTapLabel.text = "現在４人がアゲ中！"
        screenTapLabel.textAlignment = NSTextAlignment.center
        screenTapLabel.textColor = UIColor(hex: "ffffff")
        screenTapLabel.font = UIFont(name: "07NikumaruFont", size: 28)
        screenTapLabel.frame = CGRect(x: Int(widthTitleCenter), y: 750, width: 500, height: 40)
        view.addSubview(screenTapLabel)
        view.addSubview(BackButton)
        view.addSubview(screenTapLabel)
        view.addSubview(RoomSelectTitle)
        view.addSubview(screenTapLabel)
        view.addSubview(shareButton)
        // Do any additional setup after loading the view.
    }
    

    @IBAction func tapBackButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

}
