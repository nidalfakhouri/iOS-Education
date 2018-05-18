//
//  AlamofireNetworkingExampleViewController.swift
//  iOS-Education
//
//  Created by Nidal Fakhouri on 5/14/18.
//  Copyright © 2018 Nidal Fakhouri. All rights reserved.
//

import UIKit
import Alamofire

class AlamofireNetworkingExampleViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    
        title = "Alamofire"
        
        let urlString = "api.openweathermap.org/data/2.5/weather?q=London"
    }
}
