//
//  Currency.swift
//  CurrencyApp
//
//  Created by Krzysztof Kaczmarek on 21/01/2021.
//

import Foundation

struct Currency: Codable {
    let name: String
    let code: String
    let midValue: Double?
    let bidValue: Double?
    let askValue: Double?
    
    enum CodingKeys: String, CodingKey {
        case name = "currency"
        case code
        case midValue = "mid"
        case bidValue = "bid"
        case askValue = "ask"
    }
}
