//
//  ProductListCoordinatorSpec.swift
//  MercadoLivreChallengeTests
//
//  Created by Huallyd Smadi on 08/05/19.
//  Copyright © 2019 Huallyd Smadi. All rights reserved.
//

import Quick
import Nimble
import Nimble_Snapshots
import FBSnapshotTestCase

@testable import MercadoLivreChallenge

final class ProductListCoordinatorSpec: BaseTest {
    override func spec() {
        super.spec()

        var gateway: ProductGatewayMock!

        context("ProductListCoordinator") {
            beforeEach {
                gateway = ProductGatewayMock(products: ProductMock.searchedProducts!)
            }

            it("should appear list of products") {
                ProductListCoordinatorRobotFactory
                    .make(self).load(gateway: gateway)
                    .search(text: "play")
                    .result()
                    .checkSimplePromotion()
            }
        }
    }
}
