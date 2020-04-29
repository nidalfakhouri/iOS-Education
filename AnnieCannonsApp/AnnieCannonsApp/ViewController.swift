//
//  ViewController.swift
//  AnnieCannonsApp
//
//  Created by Nidal Fakhouri on 4/13/20.
//  Copyright © 2020 Nidal Fakhouri. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {

    @IBOutlet weak var weatherButton: UIButton!
    
    @IBOutlet weak var animationView: UIView!
    
    var defaultPosition = CGPoint.zero
    var isAnimationViewShown = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home Screen"
        // Do any additional setup after loading the view.

        defaultPosition = animationView.frame.origin
    }
    
    @IBAction func showTapCounter(_ sender: Any) {
        let viewController = TapCounterViewController(nibName: "TapCounterViewController", bundle: nil)
        navigationController?.pushViewController(viewController, animated: true)        
    }
    
    @IBAction func animate(_ sender: Any) {
        UIView.animate(withDuration: 2.0) {
            if self.isAnimationViewShown == false {
                self.animationView.frame = CGRect(x: 0, y: 88, width: 240, height: 128)
                self.isAnimationViewShown = true
            }
            else {
                self.animationView.frame = CGRect(x: self.defaultPosition.x, y: self.defaultPosition.y, width: 240, height: 128)
                self.isAnimationViewShown = false
            }
        }
    }
    
    @IBAction func showPersonList(_ sender: Any) {
        let viewController = PersonListViewController(nibName: "PersonListViewController", bundle: nil)
        
        var newPeople = [Person]()
        let nidal = Person(firstName: "nidal", lastName: "fakhouri", age: nil)
        let grace = Person(firstName: "grace", lastName: "mccants", age: nil)
        newPeople.append(nidal)
        newPeople.append(grace)
        
        viewController.people = newPeople
        
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    @IBAction func showWeatherData(_ sender: Any) {
        let viewController = FiveDayWeatherDataViewController(nibName: "FiveDayWeatherDataViewController", bundle: nil)
        viewController.modalTransitionStyle = UIModalTransitionStyle.flipHorizontal
        viewController.modalPresentationStyle = .fullScreen
        present(viewController, animated: true, completion: nil)
    }
    
    @IBAction func showForm(_ sender: Any) {
        let viewController = FormViewController(nibName: "FormViewController", bundle: nil)
        navigationController?.pushViewController(viewController, animated: true)
    }
}

