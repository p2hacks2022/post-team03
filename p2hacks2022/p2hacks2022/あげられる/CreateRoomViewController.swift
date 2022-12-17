//
//  CreateRoomViewController.swift
//  p2hacks2022
//
//  Created by 児玉拓海 on 2022/12/16.
//

import UIKit
import CoreData
import Firebase

class CreateRoomViewController: UIViewController {
    
    
    @IBOutlet weak var popupView: UIView!
    @IBOutlet weak var popupTitle: UILabel!
    @IBOutlet weak var InRoomName: UITextField!
    @IBOutlet weak var checkPublic: UILabel!
    let dt = Date()
    let dateFormatter = DateFormatter()
    var num = 0
    var numCount: Int!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        popupTitle.font = UIFont(name: "07NikumaruFont", size: 28)
        checkPublic.font = UIFont(name: "07NikumaruFont", size: 22)
        popupView.layer.cornerRadius = 10
        InRoomName.layer.cornerRadius = 10
    }
    @IBAction func tapBackButoon(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
    @IBAction func tapRoomCreate(_ sender: Any) {
        var ref: DatabaseReference!
        ref = Database.database().reference()
        dateFormatter.dateFormat = DateFormatter.dateFormat(fromTemplate: "yMMMdHms", options: 0, locale: Locale(identifier: "ja_JP"))
        
        //データの個数がいくつあるか読みとり
        ref.child("count").getData(completion:  { error, snapshot in
            guard error == nil else {
                print(error!.localizedDescription)
                return
            }
            if let dic = snapshot?.value as? [String:AnyObject]{
                print("データの個数は....")
                print(dic["numCount"] as? Int ?? "Unknown")
                //  print (self.room)
                self.numCount = (dic["numCount"] as? Int ?? -1)
            }
        })
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {//1.5秒後、入力されたroomname等をset。その後、idを取得
            if self.InRoomName.text != "" {
                
                ref.child("age_room/0"+String(self.numCount + 1)).setValue(
                    ["id": self.numCount+1, "Day":self.dateFormatter.string(from: self.dt),"public": true, "agecount": 0, "roomname": self.InRoomName.text!]
                )
                
                ref.child("age_room").child("0\(self.numCount+1)").getData(completion:  { error, snapshot in
                    guard error == nil else {
                        print(error!.localizedDescription)
                        return
                    }
                    if let dic = snapshot?.value as? [String:AnyObject]{
                        
                        print(dic["id"] as? Int ?? -1)
                        self.num = (dic["id"] as? Int ?? 0)
                        print("num===== \(self.num)")
                        print("\n")
                    }
                    
                })
                
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {//3秒後、FirebaseのnumCountを更新
            if self.InRoomName.text != ""{
                ref.child("count").setValue(
                    ["numCount": self.num]
                )
            }
        }
        
    }
    
    private func SetRoomData() {
        
    }
}
