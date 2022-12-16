//
//  RoomSelectViewController.swift
//  p2hacks2022
//
//  Created by 児玉拓海 on 2022/12/16.
//

import UIKit


class RoomSelectViewController: UIViewController {
    
    @IBOutlet weak var RoomSelectTitle: UILabel!
    @IBOutlet weak var BackButton: UIButton!
    @IBOutlet weak var SearchRoomName: UITextField!
    let TitleY = 80
    let SearchFieldY = 170
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //スクリーンの幅
        let screenWidth = Float(UIScreen.main.bounds.size.width)
        let TitleWidth = screenWidth - 97
        //スクリーンの高さ
//        let screenHeight = Float(UIScreen.main.bounds.size.height)
        let widthTitleCenter = (screenWidth - TitleWidth) / 2
        
        RoomSelectTitle.frame = CGRect(x: Int(widthTitleCenter), y: TitleY, width: Int(TitleWidth), height: 70)
        RoomSelectTitle.font = UIFont(name: "07NikumaruFont", size: 27)
        SearchRoomName.frame = CGRect(x: Int(widthTitleCenter), y: SearchFieldY, width: Int(TitleWidth), height: 55)
        SearchRoomName.layer.cornerRadius = 10
        BackButton.frame = CGRect(x: 25, y: 83, width: 65, height: 65)
        
    }
    @IBAction func tapBackButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
