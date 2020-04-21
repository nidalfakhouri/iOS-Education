//
//  PersonListViewController.swift
//  AnnieCannonsApp
//
//  Created by Nidal Fakhouri on 4/13/20.
//  Copyright © 2020 Nidal Fakhouri. All rights reserved.
//

import UIKit

class PersonListViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    
    var people = [Person]()
    
    let reuseIdentifier = "personTableViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Person List"
        
        tableView.dataSource = self
        tableView.delegate = self

        let nib = UINib(nibName: "PersonTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: reuseIdentifier)
    }
}

extension PersonListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: PersonTableViewCell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! PersonTableViewCell
        
        let person: Person = people[indexPath.row]
        
        cell.configure(person: person)
        cell.delegate = self
        
        return cell
    }
}

extension PersonListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let person = people[indexPath.row]
        print("the person I selected from tapping the tableview cell was \(person.firstName)")
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension PersonListViewController: PersonTableViewCellDelegate {
    
    func personTableViewCellDidTapMeButton(person: Person?) {
        print("the person I selected via the delegate was \(person?.firstName)")
    }
}
