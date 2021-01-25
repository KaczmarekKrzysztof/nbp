//
//  Rate.swift
//  CurrencyApp
//
//  Created by Krzysztof Kaczmarek on 23/01/2021.
//

import Foundation

struct Rate: Codable {
    let no: String
    let effectiveDate: String
    let midValue: Double?
    let bidValue: Double?
    let askValue: Double?
    
    enum CodingKeys: String, CodingKey {
        case no
        case effectiveDate
        case midValue = "mid"
        case bidValue = "bid"
        case askValue = "ask"
    }
    
}
