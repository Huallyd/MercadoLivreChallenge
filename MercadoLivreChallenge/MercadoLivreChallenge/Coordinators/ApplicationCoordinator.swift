//
//  ApplicationCoordinator.swift
//  MercadoLivreChallenge
//
//  Created by Huallyd Smadi on 08/05/19.
//  Copyright © 2019 Huallyd Smadi. All rights reserved.
//

import UIKit

final class ApplicationCoordinator {
    private let window: UIWindow
    private let gateway: ProductGateway
    private let rootNavigationViewController: UINavigationController

    init(window: UIWindow, gateway: ProductGateway) {
        self.window = window
        self.gateway = gateway

        rootNavigationViewController = UINavigationController()

        setupNavigationView()
    }

    private func setupNavigationView() {
        rootNavigationViewController.navigationBar.barTintColor = .lightYellow
        rootNavigationViewController.navigationBar.prefersLargeTitles = true
        rootNavigationViewController.view.accessibilityLabel = "Navigation Application"
    }
}

extension ApplicationCoordinator: Coordinator {
    func start() {
        window.rootViewController = rootNavigationViewController
        window.makeKeyAndVisible()
        

        ProductListCoordinator(navigationController: rootNavigationViewController,
                               gateway: gateway).start()
    }
}
