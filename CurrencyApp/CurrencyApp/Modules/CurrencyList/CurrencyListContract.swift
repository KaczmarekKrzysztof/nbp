//
//  CurrencyListContract.swift
//  CurrencyApp
//
//  Created by Krzysztof Kaczmarek on 22/01/2021.
//

import Foundation

enum CurrencyListAction {
    case didLoad
    case didSelect(currency: Currency)
    case didPullToRefresh
}

struct CurrencyListState {
    let isPlaceholderVisible: Bool
    let currencies: [Currency]
    let effectiveDateString: String?
    let isRefreshing: Bool
}

protocol CurrencyListViewProtocol: class {
    var currentState: CurrencyListState? { get }
    func update(with state: CurrencyListState)
}

protocol CurrencyListViewModelProtocol: class {
    var view: CurrencyListViewProtocol? { get set }
    func sendAction(_ action: CurrencyListAction)
}
