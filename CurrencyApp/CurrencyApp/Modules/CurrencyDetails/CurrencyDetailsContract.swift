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
    case didPickFromDate(date: Date)
    case didPickToDate(date: Date)
}

struct CurrencyDetailsState {
    let title: String
    let rates: [Rate]
    let isRefreshing: Bool
    let fromDate: Date
    let toDate: Date
}

protocol CurrencyDetailsViewProtocol: class {
    var currentState: CurrencyDetailsState? { get }
    func update(with state: CurrencyDetailsState)
}

protocol CurrencyDetailsViewModelProtocol: class {
    var view: CurrencyDetailsViewProtocol? { get set }
    func sendAction(_ action: CurrencyDetailsAction)
}
