//
//  FormViewController.swift
//  AnnieCannonsApp
//
//  Created by Nidal Fakhouri on 4/28/20.
//  Copyright © 2020 Nidal Fakhouri. All rights reserved.
//

import UIKit

class FormViewController: UIViewController {

    @IBOutlet var firstNameTextField: UITextField!
    @IBOutlet var lastNameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func submitAction(_ sender: Any) {
        
        if let firstName = firstNameTextField.text,
           let lastName = lastNameTextField.text,
           firstName.count > 0,
           lastName.count > 0
        {
            print("\(firstName), \(lastName) pass it to an api call here")
        }
        else {
            // show error
             let alert = UIAlertController.init(title: "Invalid Input", message: "Please enter a valid first and last name", preferredStyle: .alert)
             
             alert.addAction(UIAlertAction(title: "OK", style: .destructive, handler: { (action) in
                 self.dismiss(animated: true, completion: nil)
             }))
             
             self.present(alert, animated: true, completion: nil)
        }
        
    }
}
