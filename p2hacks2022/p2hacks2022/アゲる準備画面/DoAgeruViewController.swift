//
//  DoAgeruViewController.swift
//  p2hacks2022
//
//  Created by 小林龍ノ介 on 2022/12/16.
//


import SpriteKit
import GameplayKit
import CoreMotion
import UIKit

class ViewController: UIViewController {
    
    var myMotionManager: CMMotionManager!
    
    var upCount = 0.0
    var timeCount = 11 //タイマー秒数指定
    var createTimer:Timer?
    let numberLabel: UILabel = UILabel()//残り時間表示用のラベル
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
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
            self.view.addSubview(numberLabel)
            numberLabel.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
            numberLabel.backgroundColor = UIColor.white
            numberLabel.layer.masksToBounds = true
            numberLabel.textColor = UIColor.red
            numberLabel.textAlignment = NSTextAlignment.center
            numberLabel.layer.position = CGPoint(x: self.view.bounds.width/2,y: 200)
            numberLabel.text = String("残り\(timeCount)秒")
            //print(numberLabel)
            
            
        }
        else if timeCount == 0 {
            numberLabel.text = ("おわり")
            //タイマーを止める
            createTimer?.invalidate()
            
            //ここに時間切れの場合の処理を記述
        }
    }
    
    func upTimerStart() {
        createTimer = Timer.scheduledTimer(timeInterval:1, //1秒後指定
                                           target: self,
                                           selector: #selector(self.upCountDown),
                                           userInfo: nil,
                                           repeats: true)
    }
    @objc func upCountDown() -> (Int){
        if timeCount <= 0{
            return 1
        }else{
            return 0
        }
    }
    
    @objc func age(){
        var count = 0
        
        let countText: UILabel = UILabel()
        countText.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
        countText.backgroundColor = UIColor.orange
        countText.layer.masksToBounds = true
        countText.layer.cornerRadius = 10.0
        countText.textColor = UIColor.white
        countText.shadowColor = UIColor.gray
        countText.textAlignment = NSTextAlignment.center
        countText.layer.position = CGPoint(x: self.view.bounds.width/2,y: 280)
        
        
        // ViewにLabelを追加.
        self.view.addSubview(countText)
        
        // MotionManagerを生成.
        myMotionManager = CMMotionManager()
        
        // 更新周期を設定.
        
        myMotionManager.accelerometerUpdateInterval = 0.8
        
        var zdata = 0.0//(Double)(data.acceleration.z)
        
        
        if upCountDown() == 0{
            // 加速度の取得を開始.
            myMotionManager.startAccelerometerUpdates(to: OperationQueue.main, withHandler: {(accelerometerData, error) in
                if let e = error {
                    print(e.localizedDescription)
                    return
                }
                guard let data = accelerometerData else {
                    return
                }
                
                self.upCount += 0.8//何回この処理が繰り返されたか確認
                
                if zdata != 1{
                    if zdata - Double(data.acceleration.z) >= 0.06 || zdata - Double(data.acceleration.z) <= -0.06{
                        count += 1
                        print("zdata!=0: \(zdata)")
                        print(Double(data.acceleration.z))
                        
                        zdata = Double(data.acceleration.z)
                    }
                }else {
                    print("zdata=0\(zdata)")
                    print(Double(data.acceleration.z))
                    zdata = Double(data.acceleration.z)
                }
                
                countText.text = String("\(count)アゲ")
                
                if (round(self.upCount)) == 10.0{
                    print("Bbbbbbbb")
                    self.myMotionManager.stopAccelerometerUpdates()
                    print(count)
                }
            })
        }
    }
    
}
