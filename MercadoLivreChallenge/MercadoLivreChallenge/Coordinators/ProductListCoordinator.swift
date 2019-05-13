//
//  ProductListCoordinator.swift
//  MercadoLivreChallenge
//
//  Created by Huallyd Smadi on 08/05/19.
//  Copyright © 2019 Huallyd Smadi. All rights reserved.
//

import UIKit

final class ProductListCoordinator {
    private var productDetailCordinator: ProductDetailCoordinator?

    private lazy var productListViewController: ProductListViewController = {
        let viewController = ProductListViewController(gateway: gateway, delegate: self)
        viewController.title = R.string.navigationBar.productList()

        return viewController
    }()

    private let navigationController: UINavigationController
    private let gateway: ProductGateway

    init(navigationController: UINavigationController, gateway: ProductGateway) {
        self.navigationController = navigationController
        self.gateway = gateway
    }
}

extension ProductListCoordinator: Coordinator {
    func start() {
        navigationController.pushViewController(productListViewController, animated: true)
    }
}

extension ProductListCoordinator: ProductListViewDelegate {
    func didSelect(product: ProductViewModel) {
        productDetailCordinator = ProductDetailCoordinator(navigationController: navigationController,
                                                           viewModel: product)
        productDetailCordinator?.start()
    }
}
