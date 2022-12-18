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
    @IBOutlet weak var TabBar: UIImageView!
    @IBOutlet weak var PastAgeSearch: UITextField!
    
    let TabIconSize = 65
    let TabIconY = 695
    let TabBarY = 690
    
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
        //スクリーンの高さ
        //        let screenHeight = Float(UIScreen.main.bounds.size.height)
        //それぞれUIの画面に対する中央配置するための値
        let widthTabIconCeter = (screenWidth - Float(TabIconSize)) / 2
        let widthTabBarCenter = (screenWidth - 315) / 2
        
        PastAgeSearch.frame = CGRect(x: Int(widthTabBarCenter), y: 75, width: 315, height: 55)
        PastAgeSearch.layer.cornerRadius = 10
        
        //Tabのアイテムのサイズと位置を設定
        AgeruTab.frame = CGRect(x: 60, y: TabIconY, width: TabIconSize, height: TabIconSize)
        AgaruTab.frame = CGRect(x: Int(widthTabIconCeter), y: TabIconY, width: TabIconSize, height: TabIconSize)
        PastAgeTab.frame = CGRect(x: 315 - TabIconSize, y: TabIconY, width: TabIconSize, height: TabIconSize)
        //TabのBarのサイズと位置の設定
        TabBar.frame = CGRect(x: Int(widthTabBarCenter), y: TabIconY - 5, width: 315, height: 75)
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
    @IBAction func didTapView(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
}
