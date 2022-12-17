//
//  RoomSelectViewController.swift
//  p2hacks2022
//
//  Created by 児玉拓海 on 2022/12/16.
//

import UIKit
import Firebase

class RoomSelectViewController: UIViewController {
    
    @IBOutlet weak var RoomSelectTitle: UILabel!
    @IBOutlet weak var BackButton: UIButton!
    @IBOutlet weak var sevenRoomBackView: UIView!
    @IBOutlet weak var SearchRoomName: UITextField!
    let TitleY = 80
    let SearchFieldY = 170
    var numCount = 0
    let dt = Date()
    let dateFormatter = DateFormatter()
    var sevenCounter = 1
    var roomNameData = [String]()
    var tagInt = 0
    
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
        let TitleWidth = screenWidth - 97
        let whiteWidth = screenWidth - 45
        //スクリーンの高さ
        let screenHeight = Float(UIScreen.main.bounds.size.height)
        let widthTitleCenter = (screenWidth - TitleWidth) / 2
        let widthWhiteCenter = (screenWidth - whiteWidth) / 2
        let heightBackWhite = (screenHeight - 322)
        let buttonSpace = (heightBackWhite / 32)
        let buttonHeight = (heightBackWhite - (buttonSpace * 8)) / 7
        var lastButton = buttonSpace
        
        
        sevenRoomBackView.frame = CGRect(x: Int(widthWhiteCenter), y: SearchFieldY + 65 , width: Int(whiteWidth), height: Int(heightBackWhite))
        sevenRoomBackView.layer.cornerRadius = 10
        RoomSelectTitle.frame = CGRect(x: Int(widthTitleCenter), y: TitleY, width: Int(TitleWidth), height: 70)
        RoomSelectTitle.font = UIFont(name: "07NikumaruFont", size: 27)
        SearchRoomName.frame = CGRect(x: Int(widthWhiteCenter), y: SearchFieldY, width: Int(whiteWidth), height: 55)
        SearchRoomName.layer.cornerRadius = 10
        BackButton.frame = CGRect(x: 25, y: 83, width: 65, height: 65)
        
        var ref: DatabaseReference!
        ref = Database.database().reference()
        
        ref.child("count").getData(completion:  { error, snapshot in
            guard error == nil else {
                print(error!.localizedDescription)
                return
            }
            if let dic = snapshot?.value as? [String:AnyObject]{
                self.numCount = (dic["numCount"] as? Int ?? -1)
            }
        })
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {//2秒後、romename等を最新のものから7つ取得
            for i in 0..<self.numCount{
                ref.child("age_room").child("0\(self.numCount - i)").getData(completion:  { error, snapshot in
                    guard error == nil else {
                        print(error!.localizedDescription)
                        return
                    }
                    if let dic = snapshot?.value as? [String:AnyObject]{
                        let checkPublic = dic["public"] as? Bool ?? false
                        if checkPublic == true && self.sevenCounter <= 7 {
                            self.roomNameData.append(dic["roomname"] as? String ?? "なし")
                            self.sevenCounter = self.sevenCounter + 1
                        }
                    }
                })
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                for Name in self.roomNameData {
                    let button = UIButton()
                    let nameLabel = UILabel()
                    let buttonWidth = Int(self.sevenRoomBackView.frame.width) - 20
                    let labelWidth = Int(self.sevenRoomBackView.frame.width) - 40
                    
                    let widthButtonCenter = (Int(self.sevenRoomBackView.frame.width) - Int(buttonWidth)) / 2
                    let widthLabelCenter = (Int(self.sevenRoomBackView.frame.width) - Int(labelWidth)) / 2
                    button.backgroundColor = UIColor(hex: "FC802D")
                    button.frame = CGRect(x: Int(widthButtonCenter), y: Int(lastButton), width: Int(buttonWidth), height: Int(buttonHeight))
                    button.layer.cornerRadius = 10
                    button.tag = Int(self.tagInt)
                    button.addTarget(self, action: #selector(RoomSelectViewController.tapRoomButton), for: .touchUpInside)
                    
                    
                    nameLabel.text = Name
                    nameLabel.font = UIFont(name: "07NikumaruFont", size: 27)
                    nameLabel.textColor = UIColor(hex: "ffffff")
                    nameLabel.textAlignment =  NSTextAlignment.left
                    nameLabel.frame = CGRect(x: Int(widthLabelCenter), y: Int(lastButton), width: Int(labelWidth), height: Int(buttonHeight))
                    nameLabel.layer.cornerRadius = 10
                    self.tagInt = self.tagInt + 1
                    lastButton = lastButton + buttonSpace + buttonHeight
                    self.sevenRoomBackView.addSubview(button)
                    self.sevenRoomBackView.addSubview(nameLabel)
                }
            }
        }
    }
    
    @objc func tapRoomButton(_ sender: UIButton) {
        print(self.roomNameData[sender.tag])
        
        sender.isSelected = !sender.isSelected
    }
    
    @IBAction func tapBackButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
