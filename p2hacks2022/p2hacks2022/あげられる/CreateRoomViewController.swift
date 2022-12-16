//
//  CreateRoomViewController.swift
//  p2hacks2022
//
//  Created by 児玉拓海 on 2022/12/16.
//

import UIKit
import CoreData

class CreateRoomViewController: UIViewController {

    
    @IBOutlet weak var popupView: UIView!
    @IBOutlet weak var popupTitle: UILabel!
    @IBOutlet weak var InRoomName: UITextField!
    @IBOutlet weak var checkPublic: UILabel!
    
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
        
    }
    
}
