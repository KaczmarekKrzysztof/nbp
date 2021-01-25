//
//  CurrencyDetailsViewController.swift
//  CurrencyApp
//
//  Created by Krzysztof Kaczmarek on 23/01/2021.
//

import Foundation
import UIKit

class CurrencyDetailsViewController: UIViewController, CurrencyDetailsViewProtocol {
    private let viewModel: CurrencyDetailsViewModelProtocol
    private(set) var currentState: CurrencyDetailsState?
    
    private let headerView: CurrencyDetailsHeaderView = CurrencyDetailsHeaderView()
    private let refreshControl = UIRefreshControl()
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: CGRect.zero, style: .grouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorColor = UIColor.background()
        tableView.backgroundColor = UIColor.background()
        tableView.register(CurrencyDetailsCell.self, forCellReuseIdentifier: "CurrencyDetailsCell")
        return tableView
    }()
    
    init(viewModel: CurrencyDetailsViewModelProtocol) {
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
    
    func update(with state: CurrencyDetailsState) {
        render(state: state)
    }

}

private extension CurrencyDetailsViewController {
    
    func render(state: CurrencyDetailsState) {
        currentState = state
        title = state.title
        tableView.reloadData()
        
        if state.isRefreshing {
            refreshControl.beginRefreshing()
        }
        else if !state.isRefreshing {
            refreshControl.endRefreshing()
        }
    }
    
    func setUp() {
        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.isTranslucent = false
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(backButtonPressed))
        tableView.refreshControl = refreshControl
        refreshControl.tintColor = UIColor.white
        refreshControl.addTarget(self, action: #selector(refreshControlPulled), for: .valueChanged)
        view.backgroundColor = UIColor.background()
        view.addSubview(tableView)
        view.addSubview(headerView)
        
        headerView.translatesAutoresizingMaskIntoConstraints = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        headerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 00).isActive = true
        headerView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        headerView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        headerView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        tableView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 20).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
    }
    
    @objc
    func backButtonPressed() {
        viewModel.sendAction(.didPressBack)
    }
    
    @objc
    func refreshControlPulled() {
        viewModel.sendAction(.didPullToRefresh)
    }
    
}

extension CurrencyDetailsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentState?.rates.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CurrencyDetailsCell", for: indexPath) as? CurrencyDetailsCell,
              let rate = currentState?.rates[indexPath.row]
        else {
            return UITableViewCell()
        }
        cell.configure(with: rate)
        return cell
    }
    
}
