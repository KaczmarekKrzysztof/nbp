//
//  CurrencyDetailsContract.swift
//  CurrencyApp
//
//  Created by Krzysztof Kaczmarek on 23/01/2021.
//

import Foundation

enum CurrencyDetailsAction {
    case didLoad
    case didPressBack
    case didPullToRefresh
}

struct CurrencyDetailsState {
    let title: String
    let rates: [Rate]
    let isRefreshing: Bool
}

protocol CurrencyDetailsViewProtocol: class {
    var currentState: CurrencyDetailsState? { get }
    func update(with state: CurrencyDetailsState)
}

protocol CurrencyDetailsViewModelProtocol: class {
    var view: CurrencyDetailsViewProtocol? { get set }
    func sendAction(_ action: CurrencyDetailsAction)
}
