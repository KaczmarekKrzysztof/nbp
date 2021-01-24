//
//  CurrencyListViewModel.swift
//  CurrencyApp
//
//  Created by Krzysztof Kaczmarek on 22/01/2021.
//

import Foundation

class CurrencyListViewModel: CurrencyListViewModelProtocol {
    weak var view: CurrencyListViewProtocol?
    
    func sendAction(_ action: CurrencyListAction) {
        process(action: action)
    }
}

private extension CurrencyListViewModel {
    
    func process(action: CurrencyListAction) {
        
        switch action {
        case .didLoad:
            break
        }
    }
    
}
