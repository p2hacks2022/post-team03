//
//  AgeruViewController.swift
//  p2hacks2022
//
//  Created by 児玉拓海 on 2022/12/12.
//

import UIKit
import SwiftyGif

class AgeruViewController: UIViewController {
    
    var roomName = ""
    var id = 0
    
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
        let gifManager = SwiftyGifManager(memoryLimit: 20)
        let setupGif = try! UIImage(gifName: "アゲる手 1.gif")
        let imageView = UIImageView(gifImage: setupGif, manager: gifManager)
        imageView.frame = CGRect(x: 0, y: 0, width: Int(screenHeight), height: Int(screenWidth))
        
        let Hukidashi = try! UIImage(imageName: "roomnamehukidashi.png")
        let HukidashiView = UIImageView(image: Hukidashi)
        let widthTitleLogoCenter = (screenHeight - (screenHeight / 3)) / 2
        HukidashiView.frame = CGRect(x: Int(widthTitleLogoCenter), y: 20, width: Int(screenHeight / 3), height: 118)
        
        let widthRoomNameCenter = (screenHeight - ((screenHeight / 3) - 10)) / 2
        let roomNameLabel = UILabel()
        roomNameLabel.text = roomName
        roomNameLabel.textAlignment = NSTextAlignment.center
        roomNameLabel.textColor = UIColor(hex: "000000")
        roomNameLabel.font = UIFont(name: "07NikumaruFont", size: 28)
        roomNameLabel.frame = CGRect(x: Int(widthRoomNameCenter), y: 65, width: Int((screenHeight / 3) - 10), height: 40)
        
        
        let ageCenter = (screenHeight - 89)
        let ageCountLabel = UILabel()
        //        ageCountLabel.text =
        //        ageCountLabel.textAlignment = NSTextAlignment.center
        //        ageCountLabel.font = UIFont(name: "07NikumaruFont", size: )
        //        ageCountLabel.textColor = UIColor(hex: "EF463F")
        //        ageCountLabel.frame = CGRect(x: Int(ageCenter), y: <#T##Int#>, width: 89, height: <#T##Int#>)
        
        let age = UILabel()
        age.text = "アゲ"
        age.textAlignment = NSTextAlignment.center
        age.font = UIFont(name: "07NikumaruFont", size: 30)
        age.textColor = UIColor(hex: "ffffff")
        age.frame = CGRect(x: Int((screenHeight/2)+20), y: 319, width: 90, height: 40)
        
        
        
        let nokoriLabel = UILabel()
        nokoriLabel.text = "残り　　　秒"
        nokoriLabel.textAlignment = NSTextAlignment.left
        nokoriLabel.font = UIFont(name: "07NikumaruFont", size: 28)
        nokoriLabel.textColor = UIColor(hex: "ffffff")
        nokoriLabel.frame = CGRect(x: 30, y: 30, width: 200, height: 40)
        
        
        
        let timeLabel = UILabel()
        //        timeLabel.text =
        //        timeLabel.textAlignment = NSTextAlignment.center
        //        timeLabel.font = UIFont(name: "07NikumaruFont", size: )
        //        timeLabel.textColor = UIColor(hex: "EF463F")
        //        timeLabel.frame = CGRect(x: <#T##Int#>, y: <#T##Int#>, width: 100, height: 45)
        
        
        view.addSubview(imageView)
        view.addSubview(HukidashiView)
        view.addSubview(roomNameLabel)
        
        //        view.addSubview(ageCountLabel)
        view.addSubview(age)
        view.addSubview(nokoriLabel)
        //        view.addSubview(timeLabel)
    }
}
