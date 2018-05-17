//
//  SimpleTableViewExampleViewController.swift
//  iOS-Education
//
//  Created by Nidal Fakhouri on 5/14/18.
//  Copyright © 2018 Nidal Fakhouri. All rights reserved.
//

import UIKit

class SimpleTableViewExampleViewController: UIViewController {

    // make sure to connect the delegate from the table view to the view controller in the xib or do it in code
    @IBOutlet weak var tableView: UITableView!
    var numbers: [String] = [String]()
    var cells: Set<UITableViewCell> = Set<UITableViewCell>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Simple Table View"
        
        for i in 0...1000 {
            numbers.append(String(i))
        }
        
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "reuseIdentifier")
    }
}

extension SimpleTableViewExampleViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numbers.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = self.tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        cell.accessoryType = .disclosureIndicator
        cell.textLabel?.text = numbers[indexPath.row]
        
        
        cells.insert(cell)
        print("Number of UItableViewCells Initalized \(cells.count)")
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated:true)
    }
}





