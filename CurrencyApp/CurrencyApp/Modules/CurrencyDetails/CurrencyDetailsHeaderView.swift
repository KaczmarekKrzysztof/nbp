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
    
    var fromAction: (() -> Void)?
    var toAction: (() -> Void)?
    
    init() {
        super.init(frame: CGRect.zero)
        setUp()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(fromDate: Date, toDate: Date) {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        fromDateLabel.text = "From: \(formatter.string(from: fromDate))"
        toDateLabel.text = "To: \(formatter.string(from: toDate))"
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
        
        let fromTapGesture = UITapGestureRecognizer(target: self, action: #selector(fromTapped))
        fromDateLabel.isUserInteractionEnabled = true
        fromDateLabel.addGestureRecognizer(fromTapGesture)
        
        let toTapGesture = UITapGestureRecognizer(target: self, action: #selector(toTapped))
        toDateLabel.isUserInteractionEnabled = true
        toDateLabel.addGestureRecognizer(toTapGesture)
    }
    
    func prepareDateLabel() -> UILabel {
        let label = UILabel()
        label.textColor = UIColor.orange
        label.font = UIFont.bold(withSize: 24)
        return label
    }
    
    @objc
    func fromTapped() {
        fromAction?()
    }
    
    @objc
    func toTapped() {
        toAction?()
    }
    
}
