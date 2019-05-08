//
//  GetProductSearchUseCaseSpec.swift
//  MercadoLivreChallengeUnitTests
//
//  Created by Huallyd Smadi on 08/05/19.
//  Copyright © 2019 Huallyd Smadi. All rights reserved.
//

import Quick
import Nimble

@testable import MercadoLivreChallenge

final class GetProductSearchUseCaseSpec: QuickSpec {
    override func spec() {
        var gateway: ProductGatewayMock!
        var presenter: GetProductSearchPresenterSpy!
        var sut: GetProductSearchUseCase!

        let searchString = "play"
        
        func setupProducts() {
            gateway = ProductGatewayMock(products: ProductMock.searchedProducts!)
            presenter = GetProductSearchPresenterSpy()

            sut = GetProductSearchUseCase(gateway: gateway, presenter: presenter)
        }

        func setupEmptyProducts() {
            gateway = ProductGatewayMock(products: [])
            presenter = GetProductSearchPresenterSpy()

            sut = GetProductSearchUseCase(gateway: gateway, presenter: presenter)
        }

        func setupErrorProducts() {
            gateway = ProductGatewayMock(error: ResponseError.failed)
            presenter = GetProductSearchPresenterSpy()

            sut = GetProductSearchUseCase(gateway: gateway, presenter: presenter)
        }

        describe("GetProductSearchUseCase") {
            context("when did type a text and send it") {
                context("and is success response") {
                    context("with products found") {
                        beforeEach {
                            setupProducts()
                            sut.search(searchString: searchString)
                        }

                        it("should call gateway method of search products") {
                            expect(gateway.invokedSearchProducts).to(equal(true))
                        }

                        it("should call gateway method of search products only once") {
                            expect(gateway.invokedSearchProductsCount).to(equal(1))
                        }

                        it("should search string equal to string typed") {
                            let stringTyped = gateway.invokedSearchProductsParameters?.0

                            expect(stringTyped).to(equal(searchString))
                        }

                        it("should call presenter method of show products") {
                            expect(presenter.invokedShowProducts).to(equal(true))
                        }

                        it("shoud call presenter method of show products only once") {
                            expect(presenter.invokedShowProductsCount).to(equal(1))
                        }

                        it("should have three found products") {
                            let result = gateway.stubbedSearchProductsCompletionResult?.0
                            let products = result!.associatedValue() as! [Product]

                            expect(products.count).to(equal(3))
                        }

                        it("shouldn't call presenter method of show error") {
                            expect(presenter.invokedShowError).to(equal(false))
                        }
                    }

                    context("no products found") {
                        beforeEach {
                            setupEmptyProducts()
                            sut.search(searchString: searchString)
                        }

                        it("should call presenter method of show empty") {
                            expect(presenter.invokedShowEmpty).to(equal(true))
                        }

                        it("should call method of show empty only once") {
                            expect(presenter.invokedShowEmptyCount).to(equal(1))
                        }

                        it("should not have products") {
                            let result = gateway.stubbedSearchProductsCompletionResult?.0
                            let products = result!.associatedValue() as! [Product]

                            expect(products.isEmpty).to(equal(true))
                        }
                    }
                }

                context("and is failure response") {
                    beforeEach {
                        setupErrorProducts()
                        sut.search(searchString: searchString)
                    }

                    it("should call presenter method of show error") {
                        expect(presenter.invokedShowError).to(equal(true))
                    }

                    it("shoud call presenter method of show error only once") {
                        expect(presenter.invokedShowErrorCount).to(equal(1))
                    }

                    it("shouldn't call presenter method of show products") {
                        expect(presenter.invokedShowProducts).to(equal(false))
                    }

                    it("shouldn't call presenter method of show empty") {
                        expect(presenter.invokedShowEmpty).to(equal(false))
                    }
                }
            }
        }
    }
}
