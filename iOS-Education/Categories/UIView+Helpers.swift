//
//  UIView+Helpers.swift
//  iOS-Education
//
//  Created by Nidal Fakhouri on 4/20/20.
//  Copyright © 2020 Nidal Fakhouri. All rights reserved.
//

import Foundation
import UIKit

public extension UIView {

    func pinToSuperview() {
        
        if let superview = self.superview {
            self.translatesAutoresizingMaskIntoConstraints = false
            self.leadingAnchor.constraint(equalTo: superview.leadingAnchor).isActive = true
            self.topAnchor.constraint(equalTo: superview.topAnchor).isActive = true
            self.bottomAnchor.constraint(equalTo: superview.bottomAnchor).isActive = true
            self.trailingAnchor.constraint(equalTo: superview.trailingAnchor).isActive = true
        }
    }
}
