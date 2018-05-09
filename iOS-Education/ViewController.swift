//
//  ViewController.swift
//  iOS-Education
//
//  Created by Nidal Fakhouri on 4/19/18.
//  Copyright © 2018 Nidal Fakhouri. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Examples"
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "reuseIdentifier")
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: UITableViewCell = self.tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        
        if indexPath.row == 0 {
            cell.textLabel?.text = "Views"
        }
        else if indexPath.row == 1 {
            cell.textLabel?.text = "Buttons And Labels"
        }
        else if indexPath.row == 2 {
            cell.textLabel?.text = "Scroll Views"
        }
        else if indexPath.row == 3 {
            cell.textLabel?.text = "Table Views"
        }
        else if indexPath.row == 4 {
            cell.textLabel?.text = "Table Views Custom Cell"
        }
        else if indexPath.row == 5 {
            cell.textLabel?.text = "Collection Views"
        }
        else if indexPath.row == 6 {
            cell.textLabel?.text = "Collection Views Custom Cells"
        }
        
        cell.accessoryType = .disclosureIndicator
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row == 0 {
            let viewExampleViewController = ViewExampleViewController(nibName: "ViewExampleViewController", bundle: nil)
            navigationController?.pushViewController(viewExampleViewController, animated: true)
        }
        else if indexPath.row == 1 {
            let buttonsAndLabelsExampleViewController = ButtonsAndLabelsExampleViewController(nibName: "ButtonsAndLabelsExampleViewController", bundle: nil)
            navigationController?.pushViewController(buttonsAndLabelsExampleViewController, animated: true)
        }
        else if indexPath.row == 2 {
            
        }
        else if indexPath.row == 3 {
            
        }
        else if indexPath.row == 4 {
            
        }
        else if indexPath.row == 5 {
            
        }
        else if indexPath.row == 6 {
            
        }
        
        tableView.deselectRow(at: indexPath, animated:true)
    }
}
