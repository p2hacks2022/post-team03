//
//  AgeruPopupViewController.swift
//  p2hacks2022
//
//  Created by 児玉拓海 on 2022/12/14.
//

import UIKit

class AgeruPopupViewController: UIViewController {

    @IBOutlet weak var InRoomName: UITextField!
    @IBOutlet weak var RoomNameTitle: UILabel!
    @IBOutlet weak var PopupView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        RoomNameTitle.font = UIFont(name: "07NikumaruFont", size: 28)
        PopupView.layer.cornerRadius = 10
        InRoomName.layer.cornerRadius = 10
    }
    
    @IBAction func tapBackButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
