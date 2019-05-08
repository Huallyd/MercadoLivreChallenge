//
//  ProductDetailCoordinator.swift
//  MercadoLivreChallenge
//
//  Created by Huallyd Smadi on 08/05/19.
//  Copyright © 2019 Huallyd Smadi. All rights reserved.
//

import UIKit

final class ProductDetailCoordinator {
    private let navigationController: UINavigationController
    private let productDetailViewController: ProductDetailViewController

    init(navigationController: UINavigationController, viewModel: ProductViewModel) {
        self.navigationController = navigationController
        self.productDetailViewController = ProductDetailViewController(viewModel: viewModel)
    }
}

extension ProductDetailCoordinator: Coordinator {
    func start() {
        navigationController.pushViewController(productDetailViewController, animated: true)
    }
}
