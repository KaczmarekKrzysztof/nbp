//
//  CurrencyListViewController.swift
//  CurrencyApp
//
//  Created by Krzysztof Kaczmarek on 21/01/2021.
//

import UIKit

class CurrencyListViewController: UIViewController, CurrencyListViewProtocol {
    private let viewModel: CurrencyListViewModelProtocol
    private(set) var currentState: CurrencyListState?
    
    private let placeholderView: PlaceholderView = PlaceholderView()
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: CGRect.zero, style: .grouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorColor = UIColor.background()
        tableView.backgroundColor = UIColor.background()
        tableView.register(CurrencyListCell.self, forCellReuseIdentifier: "CurrencyListCell")
        return tableView
    }()
    
    init(viewModel: CurrencyListViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.viewModel.view = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        viewModel.sendAction(.didLoad)
    }
    
    func update(with state: CurrencyListState) {
        render(state: state)
    }

}

private extension CurrencyListViewController {
    
    func render(state: CurrencyListState) {
        
    }
    
    func setUp() {
        placeholderView.isHidden = true
        navigationController?.navigationBar.isHidden = true
        view.backgroundColor = UIColor.background()
        view.addSubview(tableView)
        view.addSubview(placeholderView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        placeholderView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        
        placeholderView.topAnchor.constraint(equalTo: view.topAnchor, constant: 00).isActive = true
        placeholderView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        placeholderView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        placeholderView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
    }
    
}

extension CurrencyListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CurrencyListCell", for: indexPath) as? CurrencyListCell else {
            return UITableViewCell()
        }
        cell.configure(with: Currency(date: Date(), name: "dolar amerykański", code: "USD", midValue: 3.7312))
        return cell
    }
    
}

