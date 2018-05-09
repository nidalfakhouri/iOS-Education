//
//  ViewExampleViewController.swift
//  iOS-Education
//
//  Created by Nidal Fakhouri on 5/9/18.
//  Copyright © 2018 Nidal Fakhouri. All rights reserved.
//

import UIKit

class ViewExampleViewController: UIViewController {

    var codeView: UIView?
    @IBOutlet weak var xibView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        let viewRect = CGRect(x: 100, y: 100, width: 150, height: 150)
        codeView = UIView(frame: viewRect)
        codeView?.backgroundColor = UIColor.black
        
        let otherView = UIView(frame: CGRect(x: 10, y: 10, width: 30, height: 30))
        otherView.backgroundColor = UIColor.red
        codeView?.addSubview(otherView)
    
        let tinyView = UIView(frame: CGRect(x: 5, y: 5, width: 5, height: 5))
        tinyView.backgroundColor = UIColor.purple
        otherView.addSubview(tinyView)
        
        if let codeView = self.codeView {
            view.addSubview(codeView)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
