//
//  RootViewController.swift
//  iOS-Education
//
//  Created by Nidal Fakhouri on 4/19/18.
//  Copyright © 2018 Nidal Fakhouri. All rights reserved.
//

import UIKit

class RootViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Examples"
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "reuseIdentifier")
    }
}

extension RootViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
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
            cell.accessoryType = .checkmark
        }
        else if indexPath.row == 1 {
            cell.textLabel?.text = "Buttons And Labels"
            cell.accessoryType = .checkmark
        }
        else if indexPath.row == 2 {
            cell.textLabel?.text = "Scroll Views"
            cell.accessoryType = .checkmark
        }
        else if indexPath.row == 3 {
            cell.textLabel?.text = "Table Views"
            cell.accessoryType = .checkmark
        }
        else if indexPath.row == 4 {
            cell.textLabel?.text = "Table Views Custom Cell"
            cell.accessoryType = .checkmark
        }
        else if indexPath.row == 5 {
            cell.textLabel?.text = "Collection Views"
            cell.accessoryType = .disclosureIndicator
        }
        else if indexPath.row == 6 {
            cell.textLabel?.text = "Autolayout"
            cell.accessoryType = .disclosureIndicator
        }
        else if indexPath.row == 7 {
            cell.textLabel?.text = "Current Location"
            cell.accessoryType = .checkmark
        }
        else if indexPath.row == 8 {
            cell.textLabel?.text = "Networking With NSURLSession"
            cell.accessoryType = .checkmark
        }
        else if indexPath.row == 9 {
            cell.textLabel?.text = "Networking With Alamofire"
            cell.accessoryType = .checkmark
        }
        else if indexPath.row == 10 {
            cell.textLabel?.text = "Weather App"
            cell.accessoryType = .disclosureIndicator
        }
        
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        var viewController: UIViewController? = nil
        
        if indexPath.row == 0 {
            viewController = ViewExampleViewController(nibName: "ViewExampleViewController", bundle: nil)
        }
        else if indexPath.row == 1 {
            viewController = ButtonsAndLabelsExampleViewController(nibName: "ButtonsAndLabelsExampleViewController", bundle: nil)
        }
        else if indexPath.row == 2 {
            viewController = ScrollViewExampleViewController(nibName: "ScrollViewExampleViewController", bundle: nil)
        }
        else if indexPath.row == 3 {
            viewController = SimpleTableViewExampleViewController(nibName: "SimpleTableViewExampleViewController", bundle: nil)
        }
        else if indexPath.row == 4 {
            viewController = CustomTableViewExampleViewController(nibName: "CustomTableViewExampleViewController", bundle: nil)
        }
        else if indexPath.row == 5 {
            viewController = CollectionViewExampleViewController(nibName: "CollectionViewExampleViewController", bundle: nil)
        }
        else if indexPath.row == 6 {
            viewController = AutoLayoutExampleViewController(nibName: "AutoLayoutExampleViewController", bundle: nil)
        }
        else if indexPath.row == 7 {
            viewController = CurrentLocationExampleViewController(nibName: "CurrentLocationExampleViewController", bundle: nil)
        }
        else if indexPath.row == 8 {
            viewController = NSURLSessionExampleViewController(nibName: "NSURLSessionExampleViewController", bundle: nil)
        }
        else if indexPath.row == 9 {
            viewController = AlamofireNetworkingExampleViewController(nibName: "AlamofireNetworkingExampleViewController", bundle: nil)
        }
        else if indexPath.row == 10 {
            viewController = WeatherRootViewController(nibName: "WeatherRootViewController", bundle: nil)
        }
        
        if let viewControllerToPush = viewController {
            navigationController?.pushViewController(viewControllerToPush, animated: true)
        }
        
        tableView.deselectRow(at: indexPath, animated:true)
    }
}
