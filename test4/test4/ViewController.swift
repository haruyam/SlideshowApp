//
//  ViewController.swift
//  test4
//
//  Created by 春山優太 on 2018/07/16.
//  Copyright © 2018年 haruyam. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    var timer: Timer?
    
    let imageNameList = ["君の名は.jpg", "青空.jpg", "未来への道.jpg"]
    var index = 0
    
    @IBAction func back(_ sender: Any) {
        index -= 1
        if index < 0 {
            index = imageNameList.count - 1
        }
        let imageName = imageNameList[index]
        imageView.image = UIImage(named: imageName)
    }

    @IBAction func next(_ sender: Any) {
        index += 1
        if index > imageNameList.count - 1 {
            index = 0
        }
        let imageName = imageNameList[index]
        imageView.image = UIImage(named: imageName)
    }
    
   
    @IBAction func startstop(_ sender: Any) {
        
        if self.timer != nil {
            self.timer?.invalidate()   // 現在のタイマーを破棄する
            self.timer = nil          // startTimer() の timer == nil で判断するために、 timer = nil としておく
        }
        else { timer = Timer.scheduledTimer(timeInterval:2.0, target: self, selector: #selector (ViewController.onTimer(timer:)), userInfo: nil, repeats: true)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        imageView.image = UIImage(named: "君の名は.jpg")
        
        // 有効化
        nextButton.isEnabled = true
        // 無効化
        nextButton.isEnabled = false
        
        // 有効化
        backButton.isEnabled = true
        // 無効化
        backButton.isEnabled = false         }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func displayImage() {
        
        // 画像の名前の配列
        
        // 画像の番号が正常な範囲を指しているかチェック
        
        // 範囲より下を指している場合、最後の画像を表示
        if index < 0 {
            index = 2
        }
        
        // 範囲より上を指している場合、最初の画像を表示
        if index > 2 {
            index = 0
        }
        
        // 表示している画像の番号から名前を取り出し
        let name = imageNameList[index]
        
        // 画像を読み込み
        let image = UIImage(named: name)
        
        // Image Viewに読み込んだ画像をセット
        imageView.image = image
    }
    
    
    
    /// NSTimerによって、一定の間隔で呼び出される関数
    @objc func onTimer(timer: Timer) {
        
        // 関数が呼ばれていることを確認
        print("onTimer")
        
        // 表示している画像の番号を1増やす
        index += 1
        
        // 表示している画像の番号を元に画像を表示する
        displayImage()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // segueから遷移先のResultViewControllerを取得する
        let resultViewController:ResultViewController = segue.destination as! ResultViewController
        // 遷移先のResultViewControllerで宣言しているx, yに値を代入して渡す
        resultViewController.imageName = imageNameList[index]
        
    }
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
        // 他の画面から segue を使って戻ってきた時に呼ばれる
    }
    
    

}

