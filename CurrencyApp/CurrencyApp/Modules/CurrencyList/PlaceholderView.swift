//
//  CVPlaceholderView.swift
//  CV
//
//  Created by Krzysztof Kaczmarek on 18/01/2021.
//  Copyright © 2021 Kaczmarek. All rights reserved.
//

import Foundation
import UIKit

class PlaceholderView: UIView {
    private lazy var activityIndicator: UIActivityIndicatorView = prepareIndicatorView()
    
    init() {
        super.init(frame: CGRect.zero)
        setUp()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

private extension PlaceholderView {
    
    func prepareIndicatorView() -> UIActivityIndicatorView {
        let activityIndicator = UIActivityIndicatorView(style: .whiteLarge)
        activityIndicator.startAnimating()
        return activityIndicator
    }
    
    func setUp() {
        backgroundColor = UIColor.background()
        addSubview(activityIndicator)
        
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0).isActive = true
        activityIndicator.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0).isActive = true
    }
}
