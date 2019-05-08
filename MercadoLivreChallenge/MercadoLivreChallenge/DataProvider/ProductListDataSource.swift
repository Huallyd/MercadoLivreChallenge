//
//  ProductListDataSource.swift
//  MercadoLivreChallenge
//
//  Created by Huallyd Smadi on 08/05/19.
//  Copyright © 2019 Huallyd Smadi. All rights reserved.
//

import UIKit

final class ProductListDataSource: NSObject {
    typealias CompletionHandler = (ProductViewModel) -> ()

    private weak var tableView: UITableView?

    private var products: [ProductViewModel] = []

    private let completion: CompletionHandler

    init(tableView: UITableView, completion: @escaping CompletionHandler) {
        self.tableView = tableView
        self.completion = completion

        super.init()

        registerCells()
        setupDataSource()
    }

    // MARK: Private functions

    private func registerCells() {
        tableView?.registerReusableCell(ProductListTableViewCell.self)
    }

    private func setupDataSource() {
        tableView?.dataSource = self
        tableView?.delegate = self
    }

    // MARK: Functions

    func setup(products: [ProductViewModel]) {
        self.products = products
        tableView?.reloadData()
    }
}

extension ProductListDataSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ProductListTableViewCell = tableView.dequeueReusableCell(indexPath: indexPath)

        cell.setup(viewModel: products[indexPath.row])

        return cell
    }
}

extension ProductListDataSource: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        completion(products[indexPath.row])
    }
}
