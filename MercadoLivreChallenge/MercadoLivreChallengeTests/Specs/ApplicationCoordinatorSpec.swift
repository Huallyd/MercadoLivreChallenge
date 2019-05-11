//
//  ApplicationCoordinatorSpec.swift
//  MercadoLivreChallengeTests
//
//  Created by Huallyd Smadi on 11/05/19.
//  Copyright © 2019 Huallyd Smadi. All rights reserved.
//

import Quick

@testable import MercadoLivreChallenge

final class ApplicationCoordinatorSpec: BaseTest {
    var gateway: ProductGatewayMock!
    var robot: ApplicationCoordinatorRobot!

    func setupProducts() {
        self.gateway = ProductGatewayMock(products: ProductMock.searchedProducts!)
    }

    override func spec() {
        super.spec()

        context("ApplicationCoordinator") {
            beforeEach {
                self.gateway = ProductGatewayMock(products: ProductMock.searchedProducts!)
                self.robot = ApplicationCoordinatorRobotFactory.make(self).load(gateway: self.gateway)
            }

            context("when start application coordinator and type a text and send it") {
                it("should appear the screen of list product") {
                    self.robot
                        .search(text: "Play")
                        .result()
                        .checkProductList()
                }

                context("and selects the cell of product") {
                    it("should appear the screen of detail product") {
                        self.robot
                            .search(text: "Play")
                            .tapCell()
                            .result()
                            .checkProductDetail()
                    }
                }
            }
        }
    }
}
