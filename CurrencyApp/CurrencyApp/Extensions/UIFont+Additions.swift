//
//  UIFont+Additions.swift
//  CV
//
//  Created by Krzysztof Kaczmarek on 17/01/2021.
//  Copyright © 2021 Kaczmarek. All rights reserved.
//

import Foundation
import UIKit

extension UIFont {
    
    static func regular(withSize size: CGFloat) -> UIFont? {
        return UIFont(name: "ChalkboardSE-Regular", size: size)
    }
    
    static func bold(withSize size: CGFloat) -> UIFont? {
        return UIFont(name: "ChalkboardSE-Bold", size: size)
    }
    
    static func light(withSize size: CGFloat) -> UIFont? {
        return UIFont(name: "ChalkboardSE-Light", size: size)
    }
}
