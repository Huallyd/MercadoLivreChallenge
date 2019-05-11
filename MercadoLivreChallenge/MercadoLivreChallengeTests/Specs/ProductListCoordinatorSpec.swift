//
//  ProductListCoordinatorSpec.swift
//  MercadoLivreChallengeTests
//
//  Created by Huallyd Smadi on 08/05/19.
//  Copyright © 2019 Huallyd Smadi. All rights reserved.
//

import Quick

@testable import MercadoLivreChallenge

final class ProductListCoordinatorSpec: BaseTest {
    var gateway: ProductGatewayMock!
    var robot: ProductListCoordinatorRobot!

    func setupProducts() {
        self.gateway = ProductGatewayMock(products: ProductMock.searchedProducts!)
        self.robot = ProductListCoordinatorRobotFactory.make(self).load(gateway: self.gateway)
    }

    func setupEmptyProducts() {
        self.gateway = ProductGatewayMock(products: [])
        self.robot = ProductListCoordinatorRobotFactory.make(self).load(gateway: self.gateway)
    }

    func setupError() {
        self.gateway = ProductGatewayMock(error: ResponseError.badRequest)
        self.robot = ProductListCoordinatorRobotFactory.make(self).load(gateway: self.gateway)
    }
    
    override func spec() {
        super.spec()

        describe("ProductListCoordinator") {
            context("when start prouct list coordinator") {
                beforeEach {
                    self.setupProducts()
                }

                it("should appear the screen list product with initial state") {
                    self.robot
                        .result()
                        .checkInitialStateList()
                }
            }

            context("when start product list coordinator and search a product and has three products") {
                beforeEach {
                    self.setupProducts()
                }

                it("should appear the screen list with three products") {
                    self.robot
                        .search(text: "Play")
                        .result()
                        .checkProductList()
                }
            }

            context("when start product list coordinator and search a product and result is empty") {
                beforeEach {
                    self.setupEmptyProducts()
                }

                it("should appear the screen list product with empty state") {
                    self.robot
                        .search(text: "A")
                        .result()
                        .checkEmptyStateList()
                }
            }

            context("when start product list coordinator and search a product and result is failed") {
                beforeEach {
                    self.setupError()
                }

                it("should appear the screen list product with error state") {
                    self.robot
                        .search(text: "Play")
                        .result()
                        .checkErrorStateList()
                }
            }
        }
    }
}
