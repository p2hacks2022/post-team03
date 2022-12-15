//
//  AgeruPubilcRoomViewController.swift
//  p2hacks2022
//
//  Created by 児玉拓海 on 2022/12/15.
//

import UIKit

class AgeruPubilcRoomViewController: UIViewController {

    @IBOutlet weak var seg: UISegmentedControl!
    @IBOutlet weak var privateRoom: UILabel!
    @IBOutlet weak var publicRoom: UILabel!
    @IBOutlet weak var RoomSearch: UIButton!
    @IBOutlet weak var AgeruTab: UIImageView!
    @IBOutlet weak var AgaruTab: UIButton!
    @IBOutlet weak var PastAge: UIButton!
    @IBOutlet weak var TabBar: UIImageView!
    
    let checkNum = 2
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //スクリーンの幅
        let screenWidth = Float(UIScreen.main.bounds.size.width)
        let widthGap = (screenWidth - Float(seg.frame.width)) / 2

        
        
        seg.frame = CGRect.init(x: Int(widthGap), y:70, width: Int(seg.frame.width), height: 50)
        seg.backgroundColor = UIColor(hex: "ffffff")
        seg.selectedSegmentTintColor = UIColor(hex: "EF463F")
        
        privateRoom.frame = CGRect(x: Int(widthGap) + 36, y: 70 , width: 265, height: 50)
        privateRoom.textColor = UIColor(hex: "CCCCCC")
        privateRoom.font = UIFont(name: "07NikumaruFont", size: 20)
        
        publicRoom.frame = CGRect(x: Int(widthGap) + 160, y: 70, width: 265, height: 50)
        publicRoom.textColor = UIColor(hex: "ffffff")
        publicRoom.font = UIFont(name: "07NikumaruFont", size: 20)
    }
    @IBAction func tapSegment(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            let storyboard = UIStoryboard(name: "AgeruSet", bundle: nil)
            let switchView = storyboard.instantiateViewController(withIdentifier: "privateage") as! AgeruSetController
            self.present(switchView, animated: false, completion: nil)
        case 1:
            return;
        default:
            return;
        }
    }
    @IBAction func tapAgaruTab(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Agerareru", bundle: nil)
        let selectTabView = storyboard.instantiateViewController(withIdentifier: "agaru") as! AgerareruViewController
        selectTabView.checkNum = checkNum
        selectTabView.modalPresentationStyle = .fullScreen
        self.present(selectTabView, animated: false, completion: nil)
    }
    @IBAction func tapPastAgeTab(_ sender: Any) {
        let storyboard = UIStoryboard(name: "PastAge", bundle: nil)
        let selectTabView = storyboard.instantiateViewController(withIdentifier: "pastage") as! PastAgeViewController
        selectTabView.checkNum = checkNum
        selectTabView.modalPresentationStyle = .fullScreen
        self.present(selectTabView, animated: false, completion: nil)
    }
}
