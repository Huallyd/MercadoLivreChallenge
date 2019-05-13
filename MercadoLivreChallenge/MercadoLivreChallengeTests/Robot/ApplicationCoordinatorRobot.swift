//
//  ApplicationCoordinatorRobot.swift
//  MercadoLivreChallengeTests
//
//  Created by Huallyd Smadi on 11/05/19.
//  Copyright © 2019 Huallyd Smadi. All rights reserved.
//

import Nimble
import Nimble_Snapshots
import UIKit

@testable import MercadoLivreChallenge

final class ApplicationCoordinatorRobotFactory {
    static func make(_ controllerSpec: BaseTest) -> ApplicationCoordinatorRobot {
        return ApplicationCoordinatorRobot(controllerSpec: controllerSpec)
    }
}

final class ApplicationCoordinatorRobot: BaseRobot {
    func load(gateway: ProductGateway) -> Self {
        ApplicationCoordinator(window: UIApplication.shared.keyWindow!, gateway: gateway).start()

        return self
    }

    func search(text: String) -> Self {
        tester.enterText(text, intoViewWithAccessibilityLabel: R.string.accessibilityLabels.searchBar())
        tester.tapView(withAccessibilityLabel: R.string.accessibilityLabels.searchConfirmButton())

        return self
    }

    func tapCell() -> Self {
        tester.tapView(withAccessibilityLabel: R.string.accessibilityLabels.productCell())

        return self
    }

    func result() -> ApplicationCoordinatorResult {
        return ApplicationCoordinatorResult(controllerSpec: controllerSpec)
    }
}

final class ApplicationCoordinatorResult: BaseRobot {
    let viewLabel = R.string.accessibilityLabels.navigationApplicaton()

    @discardableResult
    func checkProductList() -> ApplicationCoordinatorResult {
        let productList: UIView = tester.waitForView(withAccessibilityLabel: viewLabel)

        expect(productList) == snapshot("application_product_list")

        return self
    }

    @discardableResult
    func checkProductDetail() -> ApplicationCoordinatorResult {
        let productList: UIView = tester.waitForView(withAccessibilityLabel: viewLabel)

        expect(productList) == snapshot("application_product_detail")

        return self
    }
}
