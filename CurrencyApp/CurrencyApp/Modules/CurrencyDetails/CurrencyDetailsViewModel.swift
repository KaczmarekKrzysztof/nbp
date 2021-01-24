//
//  CurrencyDetailsViewModel.swift
//  CurrencyApp
//
//  Created by Krzysztof Kaczmarek on 23/01/2021.
//

import Foundation

class CurrencyDetailsViewModel: CurrencyDetailsViewModelProtocol {
    weak var view: CurrencyDetailsViewProtocol?
    
    func sendAction(_ action: CurrencyDetailsAction) {
        process(action: action)
    }
}

private extension CurrencyDetailsViewModel {
    
    func process(action: CurrencyDetailsAction) {
        
        switch action {
        case .didLoad:
            break
        }
    }
    
}
