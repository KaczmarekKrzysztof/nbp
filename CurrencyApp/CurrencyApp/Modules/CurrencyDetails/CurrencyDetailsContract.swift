//
//  CurrencyDetailsContract.swift
//  CurrencyApp
//
//  Created by Krzysztof Kaczmarek on 23/01/2021.
//

import Foundation

enum CurrencyDetailsAction {
    case didLoad
}

struct CurrencyDetailsState {

}

protocol CurrencyDetailsViewProtocol: class {
    var currentState: CurrencyDetailsState? { get }
    func update(with state: CurrencyDetailsState)
}

protocol CurrencyDetailsViewModelProtocol: class {
    var view: CurrencyDetailsViewProtocol? { get set }
    func sendAction(_ action: CurrencyDetailsAction)
}
