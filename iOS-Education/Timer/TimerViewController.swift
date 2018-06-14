//
//  TimerViewController.swift
//  iOS-Education
//
//  Created by Nidal Fakhouri on 6/13/18.
//  Copyright © 2018 Nidal Fakhouri. All rights reserved.
//

import UIKit

class TimerViewController: UIViewController {

    @IBOutlet weak var secondsLabel: UILabel!
    var timer: Timer = Timer()
    var seconds: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        secondsLabel.text = "\(seconds)"
        start()
    }
    
    func start() {
        timer.invalidate() // stops timer
        seconds = 0
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timerTriggered), userInfo: nil, repeats: true)
        timer.fire()
    }
    
    @objc func timerTriggered() {
        seconds = seconds + 1
        secondsLabel.text = "\(seconds)"
        
        if seconds == 10 {
            timer.invalidate() // stops timer
        }
    }
}
