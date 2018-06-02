//
//  CustomTableViewExampleViewController.swift
//  iOS-Education
//
//  Created by Nidal Fakhouri on 5/14/18.
//  Copyright © 2018 Nidal Fakhouri. All rights reserved.
//

import UIKit

class CustomTableViewExampleViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    fileprivate var people: [Person] = [Person]() //default empty array instead of optional
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Custom Table View"
        
        self.tableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "CustomTableViewCell")
        
        let person1 = Person(firstName: "nidal", lastName: "fakhouri", age: 35)
        let person2 = Person(firstName: "john", lastName: "doe", age: 26)
        let person3 = Person(firstName: "jane", lastName: "smith", age: 48)
        self.people = [person1, person2, person3]
        tableView.reloadData()
    }
}

extension CustomTableViewExampleViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 92 // pulled from the xib height
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: CustomTableViewCell = self.tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath) as! CustomTableViewCell
        
        let person = people[indexPath.row]
        cell.configure(with: person)
        cell.delegate = self
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated:true)
    }
}

extension CustomTableViewExampleViewController: CustomTableViewCellDelegate {
    func customTableViewDidSelectPerson(_ person: Person) {
        print(person.firstName + " " + person.lastName)
    }
}
