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
    var gateway: ProductGatewayMock!
    var presenter: GetProductSearchPresenterSpy!
    var sut: GetProductSearchUseCase!

    let searchString = "play"

    var products: [Product] {
        let result = self.gateway.stubbedSearchProductsCompletionResult?.0

        return result!.associatedValue() as! [Product]
    }

    var viewModels: [ProductViewModel] {
        return self.presenter.invokedShowProductsParameters!.products
    }

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

    override func spec() {
        super.spec()

        describe("GetProductSearchUseCase") {
            context("when did type a text and send it and is success response") {
                context("with products found") {
                    beforeEach {
                        self.setupProducts()
                        self.sut.search(searchString: self.searchString)
                    }

                    it("should call presenter method of show loading") {
                        expect(self.presenter.invokedShowLoading).to(equal(true))
                    }

                    it("should call presenter method of show loading only once") {
                        expect(self.presenter.invokedShowLoadingCount).to(equal(1))
                    }

                    it("should call gateway method of search products") {
                        expect(self.gateway.invokedSearchProducts).to(equal(true))
                    }

                    it("should call gateway method of search products only once") {
                        expect(self.gateway.invokedSearchProductsCount).to(equal(1))
                    }

                    it("should search string equal to string typed") {
                        let stringTyped = self.gateway.invokedSearchProductsParameters?.0

                        expect(stringTyped).to(equal(self.searchString))
                    }

                    it("should call presenter method of show products") {
                        expect(self.presenter.invokedShowProducts).to(equal(true))
                    }

                    it("shoud call presenter method of show products only once") {
                        expect(self.presenter.invokedShowProductsCount).to(equal(1))
                    }

                    it("should have three found products") {
                        expect(self.products.count).to(equal(3))
                    }

                    it("should call presenter method of remove loading") {
                        expect(self.presenter.invokedRemoveLoading).to(equal(true))
                    }

                    it("should call presenter method of remove loading only once") {
                        expect(self.presenter.invokedRemoveLoadingCount).to(equal(1))
                    }

                    it("shouldn't call presenter method of show empty") {
                        expect(self.presenter.invokedShowEmpty).to(equal(false))
                    }

                    it("shouldn't call presenter method of show error") {
                        expect(self.presenter.invokedShowError).to(equal(false))
                    }

                    it("should have the product with the follows values") {
                        expect(self.products[0].title).to(equal("Playstation 3"))
                        expect(self.products[0].price).to(equal(11490))
                        expect(self.products[0].currencyId).to(equal("UYU"))
                        expect(self.products[0].soldQuantity).to(equal(250))
                        expect(self.products[0].condition.rawValue).to(equal("new"))
                        expect(self.products[0].thumbnail.absoluteString).to(equal("http://image.com"))
                    }

                    context("and the product has sales and condition") {
                        it("should have the product view model with the follows values") {
                            expect(self.viewModels[0].title).to(equal("Playstation 3"))
                            expect(self.viewModels[0].price).to(equal("11490.00"))
                            expect(self.viewModels[0].currency).to(equal("UYU"))
                            expect(self.viewModels[0].soldQuantity).to(equal("250"))
                            expect(self.viewModels[0].condition).to(equal("new"))
                            expect(self.viewModels[0].status).to(equal("new - 250 vendidos"))
                            expect(self.viewModels[0].thumbnail.absoluteString).to(equal("http://image.com"))
                        }
                    }

                    context("and the product hasn't sales and condition") {
                        it("should have the product view model with the follows values") {
                            expect(self.viewModels[1].title).to(equal("Playstation 4"))
                            expect(self.viewModels[1].price).to(equal("629.90"))
                            expect(self.viewModels[1].currency).to(equal("USD"))
                            expect(self.viewModels[1].soldQuantity).to(equal("0"))
                            expect(self.viewModels[1].condition).to(equal(""))
                            expect(self.viewModels[1].status).to(equal("sem vendas"))
                            expect(self.viewModels[1].thumbnail.absoluteString).to(equal("http://image.com"))
                        }
                    }
                }

                context("no products found") {
                    beforeEach {
                        self.setupEmptyProducts()
                        self.sut.search(searchString: self.searchString)
                    }

                    it("should call presenter method of show empty") {
                        expect(self.presenter.invokedShowEmpty).to(equal(true))
                    }

                    it("should call method of show empty only once") {
                        expect(self.presenter.invokedShowEmptyCount).to(equal(1))
                    }

                    it("shouldn't have products") {
                        expect(self.products.isEmpty).to(equal(true))
                    }
                }
            }

            context("when did type a text and send it and is failure response") {
                beforeEach {
                    self.setupErrorProducts()
                    self.sut.search(searchString: self.searchString)
                }

                it("should call presenter method of show loading") {
                    expect(self.presenter.invokedShowLoading).to(equal(true))
                }

                it("should call presenter method of remove loading only once") {
                    expect(self.presenter.invokedShowLoadingCount).to(equal(1))
                }

                it("should call presenter method of show error") {
                    expect(self.presenter.invokedShowError).to(equal(true))
                }

                it("shoud call presenter method of show error only once") {
                    expect(self.presenter.invokedShowErrorCount).to(equal(1))
                }

                it("shouldn't call presenter method of show products") {
                    expect(self.presenter.invokedShowProducts).to(equal(false))
                }

                it("shouldn't call presenter method of show empty") {
                    expect(self.presenter.invokedShowEmpty).to(equal(false))
                }

                it("should call presenter method of remove loading") {
                    expect(self.presenter.invokedRemoveLoading).to(equal(true))
                }
            }
        }
    }
}
