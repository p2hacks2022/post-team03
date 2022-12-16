//
//  AgerareruViewController.swift
//  p2hacks2022
//
//  Created by 児玉拓海 on 2022/12/12.
//

import UIKit

class AgerareruViewController: UIViewController {
    
    
    @IBOutlet weak var AgeruTab: UIButton!
    @IBOutlet weak var AgaruTab: UIImageView!
    @IBOutlet weak var PastAgeTab: UIButton!
    @IBOutlet weak var TabBar: UIImageView!
    @IBOutlet weak var createRoom: UIButton!
    
    var checkNum = 0
    let TabIconSize = 65
    let TabIconY = 695
    let TabBarY = 690
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //スクリーンの幅
        let screenWidth = Float(UIScreen.main.bounds.size.width)
        //スクリーンの高さ
//        let screenHeight = Float(UIScreen.main.bounds.size.height)
        //それぞれUIの画面に対する中央配置するための値
        let widthTabIconCeter = (screenWidth - Float(TabIconSize)) / 2
        let widthTabBarCenter = (screenWidth - 315) / 2
        //Tabのアイテムのサイズと位置を設定
        AgeruTab.frame = CGRect(x: 60, y: TabIconY, width: TabIconSize, height: TabIconSize)
        AgaruTab.frame = CGRect(x: Int(widthTabIconCeter), y: TabIconY, width: TabIconSize, height: TabIconSize)
        PastAgeTab.frame = CGRect(x: 315 - TabIconSize, y: TabIconY, width: TabIconSize, height: TabIconSize)
        //TabのBarのサイズと位置の設定
        TabBar.frame = CGRect(x: Int(widthTabBarCenter), y: TabIconY - 5, width: 315, height: 75)
        //「部屋を探す」ボタンのサイズと配置の設定
        createRoom.frame = CGRect(x: Int(widthTabBarCenter), y: TabIconY - 100, width: 315, height: 67)
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
    @IBAction func tapPastAgeTab(_ sender: Any) {
        let storyboard = UIStoryboard(name: "PastAge", bundle: nil)
        let selectTabView = storyboard.instantiateViewController(withIdentifier: "pastage") as! PastAgeViewController
        selectTabView.modalPresentationStyle = .fullScreen
        self.present(selectTabView, animated: false, completion: nil)
    }
    @IBAction func tapCreateRoom(_ sender: Any) {
        let storyboard = UIStoryboard(name: "CreateRoom", bundle: nil)
        let popupView = storyboard.instantiateViewController(withIdentifier: "createroom") as! CreateRoomViewController
        self.present(popupView, animated: true, completion: nil)
    }
    
}
