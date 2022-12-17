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
    @IBOutlet weak var SearchRoomName: UITextField!
    let TitleY = 80
    let SearchFieldY = 170
    
    var numCount = 0
    let dt = Date()
    let dateFormatter = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var ref: DatabaseReference!
        ref = Database.database().reference()
        
        ref.child("count").getData(completion:  { error, snapshot in
            guard error == nil else {
                print(error!.localizedDescription)
                return
            }
            if let dic = snapshot?.value as? [String:AnyObject]{
                print("データの個数は....")
                print(dic["numCount"] as? Int ?? "Unknown")
                self.numCount = (dic["numCount"] as? Int ?? -1)
            }
        })
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {//2秒後、romename等を最新のものから7つ取得
            
            for i in 0..<7{
                ref.child("age_room").child("0\(self.numCount - i)").getData(completion:  { error, snapshot in
                    guard error == nil else {
                        print(error!.localizedDescription)
                        return
                    }
                    if let dic = snapshot?.value as? [String:AnyObject]{
                        print(dic["id"] as? Int ?? -1)
                        print(dic["roomname"] as? String ?? -1)
                        print(dic["Day"] as? String ?? -1)
                        print("\n")
                    }
                    
                })
            }
        }
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
