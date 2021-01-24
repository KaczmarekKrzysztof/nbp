//
//  MainCoordinator.swift
//
//  Created by Krzysztof Kaczmarek on 17/01/2021.
//  Copyright © 2021 Kaczmarek. All rights reserved.
//

import Foundation
import UIKit

class MainCoordinator: CoordinatorProtocol {
    var childCoordinators = [CoordinatorProtocol]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewModel = CurrencyListViewModel()
        let viewController = CurrencyListViewController(viewModel: viewModel)
        viewModel.coordinator = self
        navigationController.pushViewController(viewController, animated: false)
    }
    
    func showDetails(for currency: Currency) {
        let viewModel = CurrencyDetailsViewModel(currency: currency)
        let viewController = CurrencyDetailsViewController(viewModel: viewModel)
        viewModel.coordinator = self
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func moveBackToList() {
        navigationController.popViewController(animated: true)
    }
    
}
