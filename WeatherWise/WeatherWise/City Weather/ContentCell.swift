//
//  ContentCell.swift
//  WeatherWise
//
//  Created by Alex Vasyliev on 19.02.2023.
//

import UIKit

/// Cell with content.
class ContentCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        backgroundView = GradientView(colors: [UIColor(named: "weatherBlue100")!, UIColor(named: "weatherBlue200")!])
    }
    
    /// Content view for the cell.
    ///
    ///  Adds and constraints `innerContentView`.
    var content: UIView? {
        willSet {
            if contentView.subviews.first == newValue {
                return
            }
            
            contentView.subviews.first?.removeFromSuperview()
            if let innerContentView = newValue {
                innerContentView.translatesAutoresizingMaskIntoConstraints = false
                contentView.addSubview(innerContentView)
                innerContentView.constrainToFill(contentView)
            }
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
