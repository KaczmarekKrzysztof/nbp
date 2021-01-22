//
//  ConfigurableCellProtocol.swift
//  CV
//
//  Created by Krzysztof Kaczmarek on 17/01/2021.
//  Copyright © 2021 Kaczmarek. All rights reserved.
//

import Foundation

protocol ConfigurableCellProtocol {
    associatedtype CellModelType
    func configure(with: CellModelType)
}
