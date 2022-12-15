//
//  PastAgeViewController.swift
//  p2hacks2022
//
//  Created by 児玉拓海 on 2022/12/12.
//

import UIKit

class PastAgeViewController: UIViewController {
    
    var checkNum = 0
    @IBOutlet weak var AgeruTab: UIButton!
    @IBOutlet weak var AgaruTab: UIButton!
    @IBOutlet weak var PastAgeTab: UIImageView!
    @IBOutlet weak var TabBer: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func tapAgeruTab(_ sender: Any) {
        
        if checkNum == 1 {
            let storyboard = UIStoryboard(name: "AgeruSet", bundle: nil)
            let selectTabViewA = storyboard.instantiateViewController(withIdentifier: "privateage") as! AgeruSetController
            selectTabViewA.modalPresentationStyle = .fullScreen
            self.present(selectTabViewA, animated: false, completion: nil)
        } else if checkNum == 2 {
            let storyboard = UIStoryboard(name: "AgeruPublicRoom", bundle: nil)
            let selectTabViewB = storyboard.instantiateViewController(withIdentifier: "publicage") as! AgeruPubilcRoomViewController
            selectTabViewB.modalPresentationStyle = .fullScreen
            self.present(selectTabViewB, animated: false, completion: nil)
        } else {
            let storyboard = UIStoryboard(name: "AgeruSet", bundle: nil)
            let selectTabViewA = storyboard.instantiateViewController(withIdentifier: "privateage") as! AgeruSetController
            selectTabViewA.modalPresentationStyle = .fullScreen
            self.present(selectTabViewA, animated: false, completion: nil)
        }
    }
    @IBAction func tapAgaruTab(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Agerareru", bundle: nil)
        let selectTabView = storyboard.instantiateViewController(withIdentifier: "agaru") as! AgerareruViewController
        selectTabView.modalPresentationStyle = .fullScreen
        self.present(selectTabView, animated: false, completion: nil)
    }
    
    
}
