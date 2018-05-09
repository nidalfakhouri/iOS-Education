//
//  ButtonsAndLabelsExampleViewController.swift
//  iOS-Education
//
//  Created by Nidal Fakhouri on 5/9/18.
//  Copyright © 2018 Nidal Fakhouri. All rights reserved.
//

import UIKit

class ButtonsAndLabelsExampleViewController: UIViewController {

    var codeButton: UIButton?
    var codeLabel: UILabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        codeLabel = UILabel(frame: CGRect(x: 100, y: 60, width: 200, height: 30))
        codeLabel?.text = "Code Label"
        
        if let codeLabel = self.codeLabel {
            view.addSubview(codeLabel)
        }
        
        codeButton = UIButton(frame: CGRect(x: 100, y: 100, width: 200, height: 88))
        codeButton?.addTarget(self, action: #selector(codeAction), for: .touchUpInside)
        codeButton?.setTitleColor(UIColor.black, for: .normal)
        codeButton?.setTitleColor(UIColor.white, for: .highlighted)
        codeButton?.setTitle("Code Button", for: .normal)
        codeButton?.backgroundColor = UIColor.cyan
        
        if let codeButton = self.codeButton {
            view.addSubview(codeButton)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // notice the "@objc" means this is explicitly available to objective c code
    // https://stackoverflow.com/questions/44390378/how-can-i-deal-with-objc-inference-deprecation-with-selector-in-swift-4
    @objc func codeAction() {
        print("Code Button Tapped")
    }
}
