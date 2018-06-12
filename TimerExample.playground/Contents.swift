//: Playground - noun: a place where people can play

import UIKit

class TimerExample {
    
    var timer: Timer = Timer()
    var seconds: Int = 0
    
    func start() {
        timer.invalidate() // stops timer
        seconds = 0
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timerTriggered), userInfo: nil, repeats: true)
        timer.fire()
        
    }
    
    @objc func timerTriggered() {
        seconds = seconds + 1
        print("seconds: \(seconds)")
        
        if seconds == 10 {
            timer.invalidate() // stops timer
        }
    }
}

let timer = TimerExample()
timer.start()


