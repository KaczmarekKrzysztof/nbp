//
//  DatePickerView.swift
//  CurrencyApp
//
//  Created by Krzysztof Kaczmarek on 24/01/2021.
//

import Foundation
import UIKit

class DatePickerView: UIView {
    private lazy var buttonContainerView: UIView = prepareButtonContainer()
    private lazy var doneButton: UIButton = prepareButton("Done")
    private lazy var cancelButton: UIButton = prepareButton("Cancel")
    private lazy var datePicker: UIDatePicker = prepareDatePicker()
    
    var doneAction: ((Date) -> Void)?
    
    init() {
        super.init(frame: CGRect.zero)
        setUp()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

private extension DatePickerView {
    
    func setUp() {
        backgroundColor = UIColor.orange
        addSubview(datePicker)
        addSubview(buttonContainerView)
        buttonContainerView.addSubview(doneButton)
        buttonContainerView.addSubview(cancelButton)
        
        buttonContainerView.translatesAutoresizingMaskIntoConstraints = false
        doneButton.translatesAutoresizingMaskIntoConstraints = false
        cancelButton.translatesAutoresizingMaskIntoConstraints = false
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        
        datePicker.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20).isActive = true
        datePicker.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        datePicker.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        datePicker.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        buttonContainerView.bottomAnchor.constraint(equalTo: datePicker.topAnchor).isActive = true
        buttonContainerView.leftAnchor.constraint(equalTo: leftAnchor, constant: 10).isActive = true
        buttonContainerView.rightAnchor.constraint(equalTo: rightAnchor, constant: -10).isActive = true
        buttonContainerView.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        
        doneButton.rightAnchor.constraint(equalTo: buttonContainerView.rightAnchor).isActive = true
        doneButton.topAnchor.constraint(equalTo: buttonContainerView.topAnchor).isActive = true
        doneButton.bottomAnchor.constraint(equalTo: buttonContainerView.bottomAnchor).isActive = true
        
        cancelButton.leftAnchor.constraint(equalTo: buttonContainerView.leftAnchor).isActive = true
        cancelButton.topAnchor.constraint(equalTo: buttonContainerView.topAnchor).isActive = true
        cancelButton.bottomAnchor.constraint(equalTo: buttonContainerView.bottomAnchor).isActive = true
        
        doneButton.addTarget(self, action: #selector(doneButtonPressed), for: .touchUpInside)
        cancelButton.addTarget(self, action: #selector(cancelButtonPressed), for: .touchUpInside)
    }
    
    func prepareButton(_ title: String) -> UIButton {
        let button = UIButton()
        button.setTitleColor(UIColor.background(), for: .normal)
        button.setTitle(title, for: .normal)
        button.titleLabel?.font = UIFont.bold(withSize: 24)
        return button
    }
    
    func prepareDatePicker() -> UIDatePicker {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        if #available(iOS 13.4, *) {
            datePicker.preferredDatePickerStyle = .wheels
        }
        return datePicker
    }
    
    func prepareButtonContainer() -> UIView {
        let view = UIView()
        view.backgroundColor = UIColor.orange
        return view
    }
    
    @objc
    func doneButtonPressed() {
        doneAction?(datePicker.date)
    }
    
    @objc
    func cancelButtonPressed() {
        isHidden = true
    }
}
