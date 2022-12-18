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
    
    @IBOutlet weak var publicCheck: UISwitch!
    @IBOutlet weak var popupView: UIView!
    @IBOutlet weak var popupTitle: UILabel!
    @IBOutlet weak var InRoomName: UITextField!
    @IBOutlet weak var checkPublic: UILabel!
    let dt = Date()
    var num = 0
    let dateFormatter = DateFormatter()
    var numCount: Int!
    
    override var shouldAutorotate: Bool {
        return false
    }
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
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
        dateFormatter.dateFormat = DateFormatter.dateFormat(fromTemplate: "yMMMdHm", options: 0, locale: Locale(identifier: "ja_JP"))
        //データの個数がいくつあるか読みとり
        ref.child("count").getData(completion:  { error, snapshot in
            guard error == nil else {
                print(error!.localizedDescription)
                return
            }
            if let dic = snapshot?.value as? [String:AnyObject]{
                self.numCount = (dic["numCount"] as? Int ?? -1)
            }
        })
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {//1.5秒後、入力されたroomname等をset。その後、idを取得
            if self.InRoomName.text != "" {
                switch self.publicCheck.isOn {
                case true:
                    ref.child("age_room/0"+String(self.numCount + 1)).setValue(
                        ["id": self.numCount+1, "Day":self.dateFormatter.string(from: self.dt),"public": true, "agecount": 0, "roomname": self.InRoomName.text!]
                    )
                case false:
                    ref.child("age_room/0"+String(self.numCount + 1)).setValue(
                        ["id": self.numCount+1, "Day":self.dateFormatter.string(from: self.dt),"public": false, "agecount": 0, "roomname": self.InRoomName.text!]
                    )
                }
                ref.child("age_room").child("0\(self.numCount+1)").getData(completion:  { error, snapshot in
                    guard error == nil else {
                        print(error!.localizedDescription)
                        return
                    }
                    if let dic = snapshot?.value as? [String:AnyObject]{
                        self.num = (dic["id"] as? Int ?? 0)
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
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            let storyboard = UIStoryboard(name: "Agaru", bundle: nil)
            let start = storyboard.instantiateViewController(withIdentifier: "agaru") as! AgaruViewController
            start.modalTransitionStyle = .crossDissolve
            start.modalPresentationStyle = .fullScreen
            self.present(start, animated: true, completion: nil)
        }
    }
    @IBAction func didTapView(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
}
