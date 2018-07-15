//
//  ViewController.swift
//  お試し４
//
//  Created by 春山優太 on 2018/07/14.
//  Copyright © 2018年 haruyam. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    

    @IBOutlet weak var imageView: UIImageView!
    var image1: UIImage!
    var image2: UIImage!
    var image3: UIImage!
    
    var flg = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        image1 = UIImage(named:"君の名は.jpg")
        image2 = UIImage(named:"青空.jpg")
        image3 = UIImage(named: "未来への道.jpg")
        // Do any additional setup after loading the view, typically from a nib.
        let image = UIImage(named: "君の名は.jpg")
        imageView.image = image
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func tapped(_ sender: Any) {
        if flg{
            imageView.image = image1
            flg = false
            
        }
        
        else {
            imageView.image = image2
            flg = true
            }
    }
    @IBAction func back(_ sender: Any) {
        if flg{
            imageView.image = image2
            flg = false
            
        }
            
        else {
            imageView.image = image1
            flg = true
        }
    }
    
    var timer: Timer?
    
    /// 表示している画像の番号
    var dispImageNo = 0
    
    /// 表示している画像の番号を元に画像を表示する
    func displayImage() {
        
        // 画像の名前の配列
        let imageNameArray = [
            "君の名は.jpg",
            "青空.jpg",
            "未来への道.jpg",
            ]
        
        // 画像の番号が正常な範囲を指しているかチェック
        
        // 範囲より下を指している場合、最後の画像を表示
        if dispImageNo < 0 {
            dispImageNo = 2
        }
        
        // 範囲より上を指している場合、最初の画像を表示
        if dispImageNo > 2 {
            dispImageNo = 0
        }
        
        // 表示している画像の番号から名前を取り出し
        let name = imageNameArray[dispImageNo]
        
        // 画像を読み込み
        let image = UIImage(named: name)
        
        // Image Viewに読み込んだ画像をセット
        imageView.image = image
    }
    
   
    
    /// NSTimerによって、一定の間隔で呼び出される関数
    func onTimer(timer: Timer) {
        
        // 関数が呼ばれていることを確認
        print("onTimer")
        
        // 表示している画像の番号を1増やす
        dispImageNo += 1
        
        // 表示している画像の番号を元に画像を表示する
        displayImage()
    }
    
  
}
        

    


