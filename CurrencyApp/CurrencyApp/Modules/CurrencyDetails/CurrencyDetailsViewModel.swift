//
//  CurrencyDetailsViewModel.swift
//  CurrencyApp
//
//  Created by Krzysztof Kaczmarek on 23/01/2021.
//

import Foundation

class CurrencyDetailsViewModel: CurrencyDetailsViewModelProtocol {
    weak var view: CurrencyDetailsViewProtocol?
    weak var coordinator: MainCoordinator?
    private let currency: Currency
    
    init(currency: Currency) {
        self.currency = currency
    }
    
    func sendAction(_ action: CurrencyDetailsAction) {
        process(action: action)
    }
}

private extension CurrencyDetailsViewModel {
    
    func process(action: CurrencyDetailsAction) {
        switch action {
        case .didLoad:
            view?.update(with: CurrencyDetailsState(title: currency.name))
        case .didPressBack:
            coordinator?.moveBackToList()
        }
    }
    
}
