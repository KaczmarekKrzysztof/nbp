//
//  CurrencyDetailsCell.swift
//  CurrencyApp
//
//  Created by Krzysztof Kaczmarek on 23/01/2021.
//

import Foundation
import UIKit

class CurrencyDetailsCell: UITableViewCell, ConfigurableCellProtocol {
    typealias CellModelType = Rate
    private lazy var containerView: UIView = prepareContainerView()
    private lazy var dateLabel: UILabel = prepareLabel()
    private lazy var nameLabel: UILabel = prepareLabel()
    private lazy var askValueLabel: UILabel = prepareLabel()
    private lazy var bidValueLabel: UILabel = prepareLabel()
    private lazy var midValueLabel: UILabel = prepareLabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUp()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with rate: Rate) {
        dateLabel.text = rate.effectiveDate
        nameLabel.text = rate.no
        if let midValue = rate.midValue {
            midValueLabel.text = "\(midValue)"
            midValueLabel.isHidden = false
            askValueLabel.isHidden = true
            bidValueLabel.isHidden = true
        }
        
        if let askValue = rate.askValue, let bidValue = rate.bidValue {
            askValueLabel.text = "ASK: \(askValue)"
            bidValueLabel.text = "BID: \(bidValue)"
            midValueLabel.isHidden = true
            askValueLabel.isHidden = false
            bidValueLabel.isHidden = false
        }
    }
}

private extension CurrencyDetailsCell {
    
    func setUp() {
        selectionStyle = .none
        backgroundColor = UIColor.clear
        addSubviews()
        addConstraints()
    }
    
    func addSubviews() {
        contentView.addSubview(containerView)
        containerView.addSubview(dateLabel)
        containerView.addSubview(nameLabel)
        containerView.addSubview(askValueLabel)
        containerView.addSubview(bidValueLabel)
        containerView.addSubview(midValueLabel)
    }
    
    func addConstraints() {
        containerView.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        askValueLabel.translatesAutoresizingMaskIntoConstraints = false
        bidValueLabel.translatesAutoresizingMaskIntoConstraints = false
        midValueLabel.translatesAutoresizingMaskIntoConstraints = false
        
        containerView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10).isActive = true
        containerView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10).isActive = true
        containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true

        dateLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 8).isActive = true
        dateLabel.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -18).isActive = true
        
        nameLabel.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 18).isActive = true
        nameLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 8).isActive = true
        
        midValueLabel.leftAnchor.constraint(equalTo: nameLabel.leftAnchor, constant: 0).isActive = true
        midValueLabel.rightAnchor.constraint(equalTo: nameLabel.rightAnchor, constant: 0).isActive = true
        midValueLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 0).isActive = true
        midValueLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -10).isActive = true
        
        askValueLabel.leftAnchor.constraint(equalTo: midValueLabel.leftAnchor, constant: 0).isActive = true
        askValueLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 0).isActive = true
        askValueLabel.bottomAnchor.constraint(equalTo: midValueLabel.bottomAnchor, constant: 0).isActive = true
        
        bidValueLabel.bottomAnchor.constraint(equalTo: midValueLabel.bottomAnchor, constant: 0).isActive = true
        bidValueLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 0).isActive = true
        bidValueLabel.rightAnchor.constraint(equalTo: dateLabel.rightAnchor, constant: 0).isActive = true
    }
    
    func prepareContainerView() -> UIView {
        let containerView = UIView()
        containerView.backgroundColor = UIColor.cellBackground()
        containerView.layer.cornerRadius = 8
        containerView.layer.borderWidth = 3
        containerView.layer.borderColor = UIColor.orange.cgColor
        return containerView
    }
    
    func prepareLabel() -> UILabel {
        let label = UILabel()
        label.textColor = UIColor.orange
        label.font = UIFont.bold(withSize: 24)
        return label
    }
    
}
