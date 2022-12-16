//
//  ViewController.swift
//  p2hacks2022
//
//  Created by 児玉拓海 on 2022/12/10.
//

import UIKit

class AgeruSetController: UIViewController {

    @IBOutlet weak var seg: UISegmentedControl!
    @IBOutlet weak var privateRoom: UILabel!
    @IBOutlet weak var publicRoom: UILabel!
    @IBOutlet weak var RoomSearch: UIButton!
    @IBOutlet weak var Hukidashi: UIImageView!
    @IBOutlet weak var AgeruTab: UIImageView!
    @IBOutlet weak var AgaruTab: UIButton!
    @IBOutlet weak var PastAgeTab: UIButton!
    @IBOutlet weak var TabBar: UIImageView!
    
    let checkNum = 1
    let TabIconSize = 65
    let TabIconY = 695
    let TabBarY = 690
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //スクリーンの幅
        let screenWidth = Float(UIScreen.main.bounds.size.width)
        print(screenWidth)
        //スクリーンの高さ
        let screenHeight = Float(UIScreen.main.bounds.size.height)
        print(screenHeight)
        //それぞれUIの画面に対する中央配置するための値
        let widthGap = (screenWidth - Float(seg.frame.width)) / 2
        let widthTabIconCeter = (screenWidth - Float(TabIconSize)) / 2
        let widthHukidashiCenter = (screenWidth - 290) / 2
        let widthTabBarCenter = (screenWidth - 315) / 2
        //吹き出しのサイズと位置の設定
        Hukidashi.frame = CGRect(x: Int(widthHukidashiCenter), y: 145, width: 290, height: 118)
        //Tabのアイテムのサイズと位置を設定
        AgeruTab.frame = CGRect(x: 60, y: TabIconY, width: TabIconSize, height: TabIconSize)
        AgaruTab.frame = CGRect(x: Int(widthTabIconCeter), y: TabIconY, width: TabIconSize, height: TabIconSize)
        PastAgeTab.frame = CGRect(x: 315 - TabIconSize, y: TabIconY, width: TabIconSize, height: TabIconSize)
        //TabのBarのサイズと位置の設定
        TabBar.frame = CGRect(x: Int(widthTabBarCenter), y: TabIconY - 5, width: 315, height: 75)
        //「部屋を探す」ボタンのサイズと配置の設定
        RoomSearch.frame = CGRect(x: Int(widthTabBarCenter), y: TabIconY - 100, width: 315, height: 67)
        
        /*
         SegmentedControlのサイズと位置の設定
         背景色と選択時と非選択時のとフォント、色の設定
         それぞれのラベルのサイズと位置の設定
         */
        seg.frame = CGRect.init(x: Int(widthGap), y:70, width: Int(seg.frame.width), height: 50)
        seg.backgroundColor = UIColor(hex: "ffffff")
        seg.selectedSegmentTintColor = UIColor(hex: "EF463F")
        
        privateRoom.frame = CGRect(x: Int(widthGap) + 36, y: 70 , width: 265, height: 50)
        privateRoom.textColor = UIColor(hex: "fffffff")
        privateRoom.font = UIFont(name: "07NikumaruFont", size: 20)
        
        publicRoom.frame = CGRect(x: Int(widthGap) + 160, y: 70, width: 265, height: 50)
        publicRoom.textColor = UIColor(hex: "CCCCCC")
        publicRoom.font = UIFont(name: "07NikumaruFont", size: 20)
    }

    @IBAction func tapSegment(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            return;
        case 1:
            let storyboard = UIStoryboard(name: "AgeruPublicRoom", bundle: nil)
            let switchView = storyboard.instantiateViewController(withIdentifier: "publicage") as! AgeruPubilcRoomViewController
            self.present(switchView, animated: false, completion: nil)
        default:
            return;
        }
    }
    
    @IBAction func tapRoomSearch(_ sender: Any) {
        let storyboard = UIStoryboard(name: "AgeruPopup", bundle: nil)
        let popupView = storyboard.instantiateViewController(withIdentifier: "roompopup") as! AgeruPopupViewController
        self.present(popupView, animated: true, completion: nil)
    }
    
    
    //
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

