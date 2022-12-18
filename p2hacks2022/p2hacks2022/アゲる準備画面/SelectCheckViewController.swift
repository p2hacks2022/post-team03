//
//  SelectCheckViewController.swift
//  p2hacks2022
//
//  Created by 児玉拓海 on 2022/12/18.
//

import UIKit

class SelectCheckViewController: UIViewController {
    
    var roomName = ""
    var id = 0
    
    @IBOutlet weak var roomInCheck: UILabel!
    
    @IBOutlet weak var roomTitle: UILabel!
    
    @IBOutlet weak var popUp: UIView!
    
    override var shouldAutorotate: Bool {
        return false
    }
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        popUp.layer.cornerRadius = 10
        roomTitle.text = "「"+roomName+"」"
        roomTitle.font = UIFont(name: "07NikumaruFont", size: 28)
        roomInCheck.font = UIFont(name: "07NikumaruFont", size: 28)
    }
    
    @IBAction func backButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func InButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "SetUpGif", bundle: nil)
        let letsgo = storyboard.instantiateViewController(withIdentifier: "setupgif") as! SetUpGifViewController
        letsgo.modalTransitionStyle = .crossDissolve
        letsgo.modalPresentationStyle = .fullScreen
        letsgo.id = id
        letsgo.roomName = roomName
        self.present(letsgo, animated: true, completion: nil)
    }
}
