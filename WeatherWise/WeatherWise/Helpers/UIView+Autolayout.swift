//
//  UIView+Autolayout.swift
//  WeatherWise
//
//  Created by Alex Vasyliev on 21.02.2023.
//

import UIKit

extension UIView {
    
    /// Constraint current view to the parent view bounds.
    /// - Parameter parent: Parent view to constraint to.
    func constrainToFill(_ parent: UIView) {
        assert(superview != nil, "Must add to view hierarchy first")
        NSLayoutConstraint.activate([
            leadingAnchor.constraint(equalTo: parent.leadingAnchor),
            trailingAnchor.constraint(equalTo: parent.trailingAnchor),
            topAnchor.constraint(equalTo: parent.topAnchor),
            bottomAnchor.constraint(equalTo: parent.bottomAnchor),
        ])
    }
}
