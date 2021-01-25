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
    
    var defaultEndDate: Date {
        let endOfMonth = Date().endOfMonth
        return endOfMonth <= Date() ? endOfMonth : Date()
    }
    
    func process(action: CurrencyDetailsAction) {
        switch action {
        case .didLoad:
            let state = CurrencyDetailsState(title: self.currency.name,
                                             rates: [],
                                             isRefreshing: true,
                                             fromDate: Date().startOfMonth,
                                             toDate: defaultEndDate)
            self.view?.update(with: state)
            repository.getRates(for: currency, table: .c, fromDate: state.fromDate, toDate: state.toDate) { [weak self] (result) in
                guard let self = self else { return }
                switch result {
                case .success(let response):
                    let state = CurrencyDetailsState(title: self.currency.name,
                                                     rates: response.rates,
                                                     isRefreshing: false,
                                                     fromDate: self.view?.currentState?.fromDate ?? Date(),
                                                     toDate: self.view?.currentState?.toDate ?? Date())
                    self.view?.update(with: state)
                case .failure(_):
                    break
                }
            }
        case .didPressBack:
            coordinator?.moveBackToList()
        case .didPullToRefresh:
            let state = CurrencyDetailsState(title: self.currency.name,
                                             rates: view?.currentState?.rates ?? [],
                                             isRefreshing: true,
                                             fromDate: self.view?.currentState?.fromDate ?? Date(),
                                             toDate: self.view?.currentState?.toDate ?? Date())
            self.view?.update(with: state)
            repository.getRates(for: currency, table: .c, fromDate: self.view?.currentState?.fromDate ?? Date(), toDate: self.view?.currentState?.toDate ?? Date()) { [weak self] (result) in
                guard let self = self else { return }
                switch result {
                case .success(let response):
                    let state = CurrencyDetailsState(title: self.currency.name,
                                                     rates: response.rates,
                                                     isRefreshing: false,
                                                     fromDate: self.view?.currentState?.fromDate ?? Date(),
                                                     toDate: self.view?.currentState?.toDate ?? Date())
                    self.view?.update(with: state)
                case .failure(_):
                    break
                }
            }
        case .didPickFromDate(let date):
            let state = CurrencyDetailsState(title: self.currency.name,
                                             rates: view?.currentState?.rates ?? [],
                                             isRefreshing: true,
                                             fromDate: date,
                                             toDate: self.view?.currentState?.toDate ?? Date())
            self.view?.update(with: state)
            repository.getRates(for: currency, table: .c, fromDate: state.fromDate, toDate: state.toDate) { [weak self] (result) in
                guard let self = self else { return }
                switch result {
                case .success(let response):
                    let state = CurrencyDetailsState(title: self.currency.name,
                                                     rates: response.rates,
                                                     isRefreshing: false,
                                                     fromDate: self.view?.currentState?.fromDate ?? Date(),
                                                     toDate: self.view?.currentState?.toDate ?? Date())
                    self.view?.update(with: state)
                case .failure(_):
                    break
                }
            }
        case .didPickToDate(let date):
            let state = CurrencyDetailsState(title: self.currency.name,
                                             rates: view?.currentState?.rates ?? [],
                                             isRefreshing: true,
                                             fromDate: self.view?.currentState?.fromDate ?? Date(),
                                             toDate: date)
            self.view?.update(with: state)
            repository.getRates(for: currency, table: .c, fromDate: state.fromDate, toDate: state.toDate) { [weak self] (result) in
                guard let self = self else { return }
                switch result {
                case .success(let response):
                    let state = CurrencyDetailsState(title: self.currency.name,
                                                     rates: response.rates,
                                                     isRefreshing: false,
                                                     fromDate: self.view?.currentState?.fromDate ?? Date(),
                                                     toDate: self.view?.currentState?.toDate ?? Date())
                    self.view?.update(with: state)
                case .failure(_):
                    break
                }
            }
        }
    }
    
}
