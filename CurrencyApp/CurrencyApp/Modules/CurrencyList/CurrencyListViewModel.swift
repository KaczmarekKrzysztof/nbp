//
//  CurrencyListViewModel.swift
//  CurrencyApp
//
//  Created by Krzysztof Kaczmarek on 22/01/2021.
//

import Foundation

class CurrencyListViewModel: CurrencyListViewModelProtocol {
    weak var view: CurrencyListViewProtocol?
    weak var coordinator: MainCoordinator?
    private let repository = CurrencyRepository()
    
    func sendAction(_ action: CurrencyListAction) {
        process(action: action)
    }
}

private extension CurrencyListViewModel {
    
    func process(action: CurrencyListAction) {
        switch action {
        case .didLoad:
            let state = CurrencyListState(isPlaceholderVisible: true, currencies: [], effectiveDateString: nil, isRefreshing: true)
            view?.update(with: state)
            repository.getCurrencies(for: .c) { [weak self] (result) in
                switch result {
                case .success(let response):
                    let state = CurrencyListState(isPlaceholderVisible: false, currencies: response.currencies, effectiveDateString: response.effectiveDate, isRefreshing: false)
                    self?.view?.update(with: state)
                case .failure(_):
                    break
                }
            }
        case .didSelect(let currency):
            coordinator?.showDetails(for: currency)
        case .didPullToRefresh:
            let state = CurrencyListState(isPlaceholderVisible: true, currencies: view?.currentState?.currencies ?? [], effectiveDateString: nil, isRefreshing: true)
            view?.update(with: state)
            repository.getCurrencies(for: .c) { [weak self] (result) in
                switch result {
                case .success(let response):
                    let state = CurrencyListState(isPlaceholderVisible: false, currencies: response.currencies, effectiveDateString: response.effectiveDate, isRefreshing: false)
                    self?.view?.update(with: state)
                case .failure(_):
                    break
                }
            }
        }
    }
    
}
