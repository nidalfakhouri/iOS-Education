//
//  ViewController.swift
//  AnnieCannonsApp
//
//  Created by Nidal Fakhouri on 4/13/20.
//  Copyright © 2020 Nidal Fakhouri. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home Screen"
        // Do any additional setup after loading the view.
    }
    
    @IBAction func showTapCounter(_ sender: Any) {
        let viewController = TapCounterViewController(nibName: "TapCounterViewController", bundle: nil)
        navigationController?.pushViewController(viewController, animated: true)
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
}

