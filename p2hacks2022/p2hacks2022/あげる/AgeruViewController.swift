//
//  AgeruViewController.swift
//  p2hacks2022
//
//  Created by 児玉拓海 on 2022/12/12.
//

import UIKit
import SwiftyGif
import SpriteKit
import GameplayKit
import CoreMotion
import Firebase

class AgeruViewController: UIViewController {
    
    //スクリーンの幅
    let screenWidth = Float(UIScreen.main.bounds.size.width)
    //スクリーンの高さ
    let screenHeight = Float(UIScreen.main.bounds.size.height)
    
    var roomName = ""
    var id = 0
    
    var myMotionManager: CMMotionManager!
    
    var upCount = 0.0
    var timeCount = 11 //タイマー秒数指定
    var createTimer:Timer?
    var count = 0
    var checkAgeCount = 0
    let timeLabel = UILabel()
    let nokoriLabel = UILabel()
    
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .landscapeRight
    }
    override var shouldAutorotate: Bool {
        return false
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let gifManager = SwiftyGifManager(memoryLimit: 20)
        let setupGif = try! UIImage(gifName: "アゲる手 1.gif")
        let imageView = UIImageView(gifImage: setupGif, manager: gifManager)
        imageView.frame = CGRect(x: 0, y: 0, width: Int(screenHeight), height: Int(screenWidth))
        
        let Hukidashi = try! UIImage(imageName: "roomnamehukidashi.png")
        let HukidashiView = UIImageView(image: Hukidashi)
        let widthTitleLogoCenter = (screenHeight - (screenHeight / 3)) / 2
        HukidashiView.frame = CGRect(x: Int(widthTitleLogoCenter), y: 20, width: Int(screenHeight / 3), height: 118)
        
        let widthRoomNameCenter = (screenHeight - ((screenHeight / 3) - 10)) / 2
        let roomNameLabel = UILabel()
        roomNameLabel.text = roomName
        roomNameLabel.textAlignment = NSTextAlignment.center
        roomNameLabel.textColor = UIColor(hex: "000000")
        roomNameLabel.font = UIFont(name: "07NikumaruFont", size: 28)
        roomNameLabel.frame = CGRect(x: Int(widthRoomNameCenter), y: 65, width: Int((screenHeight / 3) - 10), height: 40)
        
        let age = UILabel()
        age.text = "アゲ"
        age.textAlignment = NSTextAlignment.center
        age.font = UIFont(name: "07NikumaruFont", size: 30)
        age.textColor = UIColor(hex: "ffffff")
        age.frame = CGRect(x: Int((screenHeight/2)+20), y: 319, width: 90, height: 40)
        
        
        
        let nokoriLabel = UILabel()
        nokoriLabel.text = "残り　　　秒"
        nokoriLabel.textAlignment = NSTextAlignment.left
        nokoriLabel.font = UIFont(name: "07NikumaruFont", size: 28)
        nokoriLabel.textColor = UIColor(hex: "ffffff")
        nokoriLabel.frame = CGRect(x: 30, y: 30, width: 200, height: 40)
        
        
        view.addSubview(imageView)
        view.addSubview(HukidashiView)
        view.addSubview(roomNameLabel)
        
        view.addSubview(ageCountLabel)
        view.addSubview(age)
        view.addSubview(nokoriLabel)
        
        
        timerStart() //タイマー呼び出し
    }
    
    
    func timerStart() {
        createTimer = Timer.scheduledTimer(timeInterval:1, //1秒毎指定
                                           target: self,
                                           selector: #selector(self.countDown),
                                           userInfo: nil,
                                           repeats: true)
    }
    @objc func countDown(sender:Timer) {
        timeCount -= 1
        if timeCount == 10 {
            age()
        }
        //残り時間をラベルに表示
        if 0<timeCount && timeCount<21 {
            print(timeCount)
            view.addSubview(timeLabel)
            timeLabel.text = String(timeCount)
            timeLabel.textAlignment = NSTextAlignment.center
            timeLabel.font = UIFont(name: "07NikumaruFont", size: 53)
            timeLabel.textColor = UIColor(hex: "EF463F")
            timeLabel.frame = CGRect(x: 75, y: 25, width: 100, height: 45)
            //print(numberLabel)
            
            
        }
        else if timeCount == 0 {
            timeLabel.text = ("0")
            //タイマーを止める
            createTimer?.invalidate()
            
            //ここに時間切れの場合の処理を記述
        }
    }
    
    @objc func age(){
        
        let ageCenter = (screenHeight - 89) / 2
        let ageCountLabel = UILabel()
        ageCountLabel.textAlignment = NSTextAlignment.center
        ageCountLabel.font = UIFont(name: "07NikumaruFont", size: 65)
        ageCountLabel.textColor = UIColor(hex: "EF463F")
        ageCountLabel.frame = CGRect(x: Int(ageCenter), y: 220, width: 100, height: 150)
        
        // ViewにLabelを追加.
        self.view.addSubview(ageCountLabel)
        
        // MotionManagerを生成.
        myMotionManager = CMMotionManager()
        
        // 更新周期を設定.
        
        myMotionManager.accelerometerUpdateInterval = 0.5
        
        var zdata = 0.0//(Double)(data.acceleration.z)
        
        
        // 加速度の取得を開始.
        myMotionManager.startAccelerometerUpdates(to: OperationQueue.main, withHandler: {(accelerometerData, error) in
            if let e = error {
                print(e.localizedDescription)
                return
            }
            guard let data = accelerometerData else {
                return
            }
            
            self.upCount += 0.5//何回この処理が繰り返されたか確認
            print("abc==")
            print(self.upCount)
            if zdata != 1{
                if zdata - Double(data.acceleration.z) >= 0.05 || zdata - Double(data.acceleration.z) <= -0.05{
                    self.count += 1
                    print("zdata!=0: \(zdata)")
                    print(Double(data.acceleration.z))
                    
                    zdata = Double(data.acceleration.z)
                }
            }else {
                zdata = Double(data.acceleration.z)
            }
            
            ageCountLabel.text = String(self.count)
            
            if (round(self.upCount)) == 11.0{
                print("Bbbbbbbb")
                self.myMotionManager.stopAccelerometerUpdates()
                print(self.count)
                
                var ref: DatabaseReference!
                ref = Database.database().reference()
                ref.child("age_room").child("0\(self.id)").getData(completion:  { error, snapshot in
                    guard error == nil else {
                        print(error!.localizedDescription)
                        return
                    }
                    if let dic = snapshot?.value as? [String:AnyObject]{
                        self.checkAgeCount = dic["agecount"] as? Int ?? 0
                        print("agecount=")
                        print(self.checkAgeCount)
                    }
                })
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
                    ref.child("age_room").child("0\(self.id)").updateChildValues(["agecount": self.checkAgeCount + self.count])
                }
            }
        })
    }
}
