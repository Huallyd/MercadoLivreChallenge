//
//  ProductListViewController.swift
//  MercadoLivreChallenge
//
//  Created by Huallyd Smadi on 08/05/19.
//  Copyright © 2019 Huallyd Smadi. All rights reserved.
//

import UIKit

final class ProductListViewController: UIViewController {
    private lazy var productSearchUseCase: GetProductSearchUseCase =  {
        return GetProductSearchUseCase(gateway: gateway, presenter: self)
    }()

    private lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.delegate = self
        searchBar.accessibilityLabel = "Search Bar"

        return searchBar
    }()

    private lazy var dataSource: ProductListDataSource = {
        let completion: ProductListDataSource.CompletionHandler = { [weak self] viewModel in
            self?.didSelect(viewModel: viewModel)
        }

        let dataSource = ProductListDataSource(tableView: tableView,
                                               completion: completion)

        return dataSource
    }()

    private let tableView: UITableView = {
        let tableView = UITableView()

        return tableView
    }()

    private let gateway: ProductGateway
    private var delegate: ProductListViewDelegate?

    // MARK: Initializer

    init(gateway: ProductGateway, delegate: ProductListViewDelegate) {
        self.gateway = gateway
        self.delegate = delegate

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Life Cycle

    override func loadView() {
        super.loadView()

        setupView()
        setupLayout()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        if let indexPath = tableView.indexPathForSelectedRow {
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }

    // MARK: Private functions

    private func setupView() {
        view.accessibilityLabel = "Search List"
    }

    private func setupLayout() {
        view.addSubview(searchBar, constraints: [
            searchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])

        view.addSubview(tableView, constraints: [
            tableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

    private func didSelect(viewModel: ProductViewModel) {
        delegate?.didSelect(product: viewModel)
    }
}

extension ProductListViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let text = searchBar.text {
            productSearchUseCase.search(searchString: text)
            searchBar.resignFirstResponder()
        }
    }
}

extension ProductListViewController: GetProductSearchPresenter {
    func show(products: [ProductViewModel]) {
        dataSource.setup(products: products)
    }

    func show(error: Error) {
        
    }

    func showEmpty() {

    }
}
