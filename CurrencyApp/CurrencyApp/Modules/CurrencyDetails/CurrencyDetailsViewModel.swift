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
    private let repository = CurrencyRepository()
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
            let state = CurrencyDetailsState(title: self.currency.name, rates: [], isRefreshing: true)
            self.view?.update(with: state)
            repository.getRates(for: currency, table: .c, fromDate: Date().addingTimeInterval(-(480 * 60 * 60)), toDate: Date()) { [weak self] (result) in
                guard let self = self else { return }
                switch result {
                case .success(let response):
                    let state = CurrencyDetailsState(title: self.currency.name, rates: response.rates, isRefreshing: false)
                    self.view?.update(with: state)
                case .failure(_):
                    break
                }
            }
        case .didPressBack:
            coordinator?.moveBackToList()
        case .didPullToRefresh:
            let state = CurrencyDetailsState(title: self.currency.name, rates: view?.currentState?.rates ?? [], isRefreshing: true)
            self.view?.update(with: state)
            repository.getRates(for: currency, table: .c, fromDate: Date().addingTimeInterval(-(480 * 60 * 60)), toDate: Date()) { [weak self] (result) in
                guard let self = self else { return }
                switch result {
                case .success(let response):
                    let state = CurrencyDetailsState(title: self.currency.name, rates: response.rates, isRefreshing: false)
                    self.view?.update(with: state)
                case .failure(_):
                    break
                }
            }
        }
    }
    
}
