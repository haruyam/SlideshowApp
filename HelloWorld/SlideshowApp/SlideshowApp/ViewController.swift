//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 春山優太 on 2018/07/12.
//  Copyright © 2018年 haruyam. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    var image1: UIImage!
    var image2: UIImage!
    var image3: UIImage!
    var timer :Timer?
    
    

    
    image1 = UIImage(named:"君の名は.jpg")
    image2 = UIImage(named:"青空.jpg")
    image3 = UIImage(named: "未来への道.jpg")
    // Do any additional setup after loading the view, typically from a nib.
    let image = UIImage(named: "君の名は.jpg")
    imageView.image = image
    
}
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the #imageLiteral(resourceName: "未来への道.jpg")view, typically from a nib.
        let image = UIImage(named: "君の名は.jpg")
        imageView.image = image
        
        timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(updateTimer(_:)), userInfo: nil, repeats: true)
    }
    @objc func updateTimer(_ timer: Timer) {
        self.displayImageNo += 1
        self.imageView.image = UIImage(named: "君の名は.jpg")
        
    }
    func updateTimer(timer: Timer) {
        
        // 関数が呼ばれていることを確認
        print("updateTimer")
        displayImageNo += 1
        
        // 表示している画像の番号を元に画像を表示する
        displayImage()
        
        }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func backTimer(_ sender: Any) {
        displayImageNo -= 1
       
    }
    
    @IBAction func paiseTimer(_ sender: Any) {
        self.timer?.invalidate()
        self.timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(updateTimer(_:)), userInfo: nil, repeats: true)
    }

    @IBAction func nextTimer(_ sender: Any) {
        displayImageNo += 1
    }
   
}





