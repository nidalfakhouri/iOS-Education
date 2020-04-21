//
//  PersonTableViewCell.swift
//  AnnieCannonsApp
//
//  Created by Nidal Fakhouri on 4/16/20.
//  Copyright © 2020 Nidal Fakhouri. All rights reserved.
//

import UIKit

protocol PersonTableViewCellDelegate {
    func personTableViewCellDidTapMeButton(person: Person?)
}

class PersonTableViewCell: UITableViewCell {

    var delegate: PersonTableViewCellDelegate?
    
    @IBOutlet var firstNameLabel: UILabel!
    @IBOutlet var lastNameLabel: UILabel!
    
    var person: Person? = nil
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func configure(person: Person) {
        self.person = person
        firstNameLabel.text = person.firstName
        lastNameLabel.text = person.lastName
    }
    
    @IBAction func meButtonTapped(_ sender: Any) {
        // hey somebody do something with my person object
        delegate?.personTableViewCellDidTapMeButton(person: self.person)
    }
}
