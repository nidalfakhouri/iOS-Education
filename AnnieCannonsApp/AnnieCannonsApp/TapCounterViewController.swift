//
//  TapCounterViewController.swift
//  AnnieCannonsApp
//
//  Created by Nidal Fakhouri on 4/13/20.
//  Copyright © 2020 Nidal Fakhouri. All rights reserved.
//

import UIKit

class TapCounterViewController: UIViewController {

    var count: Int = 0
    
    @IBOutlet var counterLabel: UILabel!
    @IBOutlet var countButton: UIButton!
    @IBOutlet var resetButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Tap Counter"
        count = 0
        
        // Do any additional setup after loading the view.
    }

    @IBAction func incrementCount(_ sender: Any) {
        count = count + 1
        updateCounterLabel()
        //counterLabel.text = String(count)
    }
    
    @IBAction func resetCount(_ sender: Any) {
        count = 0
        updateCounterLabel()
    }
    
    func updateCounterLabel() {
        counterLabel.text = "\(count)"
    }
}
