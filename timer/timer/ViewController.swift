//
//  ViewController.swift
//  timer
//
//  Created by 春山優太 on 2018/07/07.
//  Copyright © 2018年 haruyam. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timerLabel: UILabel!
    var timer_sec:Float = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateTimer(_:)), userInfo: nil, repeats: true)    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @objc func updateTimer(_ timer: Timer) {
        self.timer_sec += 0.1
        self.timerLabel.text = String(format: "%.1f", timer_sec)
    }
}


