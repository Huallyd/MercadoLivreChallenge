//
//  ProductDetailCoordinator.swift
//  MercadoLivreChallenge
//
//  Created by Huallyd Smadi on 08/05/19.
//  Copyright © 2019 Huallyd Smadi. All rights reserved.
//

import UIKit

final class ProductDetailCoordinator {
    private lazy var productDetailViewController: ProductDetailViewController = {
        let viewController = ProductDetailViewController(viewModel: viewModel)
        viewController.title = "Detalhe"

        return viewController
    }()

    private let navigationController: UINavigationController
    private let viewModel: ProductViewModel

    init(navigationController: UINavigationController, viewModel: ProductViewModel) {
        self.navigationController = navigationController
        self.viewModel = viewModel
    }
}

extension ProductDetailCoordinator: Coordinator {
    func start() {
        navigationController.pushViewController(productDetailViewController, animated: true)
    }
}
