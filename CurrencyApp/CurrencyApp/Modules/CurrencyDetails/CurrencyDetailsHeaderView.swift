//
//  CurrencyDetailsHeaderView.swift
//  CurrencyApp
//
//  Created by Krzysztof Kaczmarek on 23/01/2021.
//

import Foundation
import UIKit

class CurrencyDetailsHeaderView: UIView {
    private lazy var fromDateLabel: UILabel = prepareDateLabel()
    private lazy var toDateLabel: UILabel = prepareDateLabel()
    
    init() {
        super.init(frame: CGRect.zero)
        setUp()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension CurrencyDetailsHeaderView {
    
    func setUp() {
        backgroundColor = UIColor.background()
        addSubview(fromDateLabel)
        addSubview(toDateLabel)
        
        fromDateLabel.translatesAutoresizingMaskIntoConstraints = false
        toDateLabel.translatesAutoresizingMaskIntoConstraints = false
        
        fromDateLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        fromDateLabel.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        fromDateLabel.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        
        toDateLabel.topAnchor.constraint(equalTo: fromDateLabel.bottomAnchor).isActive = true
        toDateLabel.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        toDateLabel.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        toDateLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    func prepareDateLabel() -> UILabel {
        let label = UILabel()
        label.textColor = UIColor.orange
        label.font = UIFont.bold(withSize: 24)
        return label
    }
    
}
