//
//  ProductListCoordinatorRobot.swift
//  MercadoLivreChallengeTests
//
//  Created by Huallyd Smadi on 08/05/19.
//  Copyright © 2019 Huallyd Smadi. All rights reserved.
//

import Nimble
import Nimble_Snapshots
import UIKit

@testable import MercadoLivreChallenge

final class ProductListCoordinatorRobotFactory {
    static func make(_ controllerSpec: BaseTest) -> ProductListCoordinatorRobot {
        return ProductListCoordinatorRobot(controllerSpec: controllerSpec)
    }
}

final class ProductListCoordinatorRobot: BaseRobot {
    func load(gateway: ProductGateway) -> Self {
        let navigationController = UINavigationController()

        ProductListCoordinator(navigationController: navigationController, gateway: gateway).start()

        controllerSpec.rootViewController = navigationController

        return self
    }

    func search(text: String) -> Self {
        tester.enterText(text, intoViewWithAccessibilityLabel: "Search Bar")
        tester.tapView(withAccessibilityLabel: "Search")

        return self
    }

    func result() -> ProductListCoordinatorResult {
        return ProductListCoordinatorResult(controllerSpec: controllerSpec)
    }
}

final class ProductListCoordinatorResult: BaseRobot {
    let viewLabel = "Search List"

    @discardableResult
    func checkInitialStateList() -> ProductListCoordinatorResult {
        let productList: UIView = tester.waitForView(withAccessibilityLabel: viewLabel)

        expect(productList) == snapshot("product_list_initial_state")

        return self
    }

    @discardableResult
    func checkProductList() -> ProductListCoordinatorResult {
        let productList: UIView = tester.waitForView(withAccessibilityLabel: viewLabel)

        expect(productList) == snapshot("product_list")

        return self
    }

    @discardableResult
    func checkEmptyStateList() -> ProductListCoordinatorResult {
        let productList: UIView = tester.waitForView(withAccessibilityLabel: viewLabel)

        expect(productList) == snapshot("product_list_empty_state")

        return self
    }

    @discardableResult
    func checkErrorStateList() -> ProductListCoordinatorResult {
        let productList: UIView = tester.waitForView(withAccessibilityLabel: viewLabel)

        expect(productList) == snapshot("product_list_error_state")

        return self
    }
}
