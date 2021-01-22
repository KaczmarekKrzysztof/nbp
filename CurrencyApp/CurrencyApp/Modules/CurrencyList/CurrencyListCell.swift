//
//  CurrencyListCell.swift
//  CurrencyApp
//
//  Created by Krzysztof Kaczmarek on 21/01/2021.
//

import Foundation
import UIKit

class CurrencyListCell: UITableViewCell, ConfigurableCellProtocol {
    typealias CellModelType = Currency
    private lazy var containerView: UIView = prepareContainerView()
    private lazy var dateLabel: UILabel = prepareDateLabel()
    private lazy var nameLabel: UILabel = prepareNameLabel()
    private lazy var codeLabel: UILabel = prepareCodeLabel()
    private lazy var midValueLabel: UILabel = prepareMidValueLabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUp()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with currency: Currency) {
        dateLabel.text = "2020-01-21"
        nameLabel.text = currency.name
        codeLabel.text = "\(currency.code)"
        midValueLabel.text = "\(currency.midValue)"
    }
}

private extension CurrencyListCell {
    
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
        containerView.addSubview(codeLabel)
        containerView.addSubview(midValueLabel)
    }
    
    func addConstraints() {
        containerView.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        codeLabel.translatesAutoresizingMaskIntoConstraints = false
        midValueLabel.translatesAutoresizingMaskIntoConstraints = false
        
        containerView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10).isActive = true
        containerView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10).isActive = true
        containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true

        nameLabel.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 18).isActive = true
        nameLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 8).isActive = true
        //nameLabel.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -18).isActive = true
        
        dateLabel.leftAnchor.constraint(equalTo: nameLabel.rightAnchor, constant: 0).isActive = true
        dateLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 8).isActive = true
        dateLabel.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -18).isActive = true
        
        codeLabel.leftAnchor.constraint(equalTo: nameLabel.leftAnchor, constant: 0).isActive = true
        codeLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 0).isActive = true
        codeLabel.rightAnchor.constraint(equalTo: nameLabel.rightAnchor, constant: 0).isActive = true
        
        midValueLabel.leftAnchor.constraint(equalTo: nameLabel.leftAnchor, constant: 0).isActive = true
        midValueLabel.rightAnchor.constraint(equalTo: nameLabel.rightAnchor, constant: 0).isActive = true
        midValueLabel.topAnchor.constraint(equalTo: codeLabel.bottomAnchor, constant: 0).isActive = true
        midValueLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -10).isActive = true
    }
    
    func prepareContainerView() -> UIView {
        let containerView = UIView()
        containerView.backgroundColor = UIColor.cellBackground()
        containerView.layer.cornerRadius = 8
        containerView.layer.borderWidth = 3
        containerView.layer.borderColor = UIColor.orange.cgColor
        return containerView
    }
    
    func prepareDateLabel() -> UILabel {
        let label = UILabel()
        label.textColor = UIColor.orange
        label.font = UIFont.bold(withSize: 24)
        return label
    }
    
    func prepareNameLabel() -> UILabel {
        let label = UILabel()
        label.textColor = UIColor.orange
        label.font = UIFont.bold(withSize: 24)
        return label
    }
    
    func prepareCodeLabel() -> UILabel {
        let label = UILabel()
        label.textColor = UIColor.orange
        label.font = UIFont.bold(withSize: 24)
        return label
    }
    
    func prepareMidValueLabel() -> UILabel {
        let label = UILabel()
        label.textColor = UIColor.orange
        label.font = UIFont.bold(withSize: 24)
        return label
    }
    
}
