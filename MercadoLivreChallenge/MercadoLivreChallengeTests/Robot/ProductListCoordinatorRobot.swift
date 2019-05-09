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
    let identifier = "product_list_identifier"

    @discardableResult
    func checkList() -> ProductListCoordinatorResult {
        let productList: UIView = tester.waitForView(withAccessibilityLabel: identifier)
    
        expect(productList) == recordSnapshot("product_list")

        return self
    }
}
