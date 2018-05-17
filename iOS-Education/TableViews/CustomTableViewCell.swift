//
//  CustomTableViewCell.swift
//  iOS-Education
//
//  Created by Nidal Fakhouri on 5/14/18.
//  Copyright © 2018 Nidal Fakhouri. All rights reserved.
//

import UIKit

protocol CustomTableViewCellDelegate {
    func customTableViewDidSelectPerson(_ person: Person)
}

class CustomTableViewCell: UITableViewCell {

    var delegate: CustomTableViewCellDelegate?
    
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    
    @IBOutlet weak var thisIsMeButton: UIButton!
    fileprivate var person: Person? = nil
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(with person: Person) {
        self.person = person
        firstNameLabel.text = person.firstName
        lastNameLabel.text = person.lastName
        ageLabel.text = "\(person.age)"
    }
    
    @IBAction func thisIsMeAction(_ sender: Any) {
        if let person = self.person {
            delegate?.customTableViewDidSelectPerson(person)
        }
    }
}
