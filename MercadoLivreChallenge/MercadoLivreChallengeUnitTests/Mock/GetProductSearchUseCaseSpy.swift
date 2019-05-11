//
//  GetProductSearchPresenterSpy.swift
//  MercadoLivreChallenge
//
//  Created by Huallyd Smadi on 08/05/19.
//  Copyright © 2019 Huallyd Smadi. All rights reserved.
//

@testable import MercadoLivreChallenge

final class GetProductSearchPresenterSpy: GetProductSearchPresenter {
    private(set) var invokedShowProducts = false
    private(set) var invokedShowProductsCount = 0
    private(set) var invokedShowProductsParameters: (products: [ProductViewModel], Void)?
    private(set) var invokedShowProductsParametersList = [(products: [ProductViewModel], Void)]()

    func show(products: [ProductViewModel]) {
        invokedShowProducts = true
        invokedShowProductsCount += 1
        invokedShowProductsParameters = (products, ())
        invokedShowProductsParametersList.append((products, ()))
    }

    private(set) var invokedShowEmpty = false
    private(set) var invokedShowEmptyCount = 0

    func showEmpty() {
        invokedShowEmpty = true
        invokedShowEmptyCount += 1
    }

    private(set) var invokedShowError = false
    private(set) var invokedShowErrorCount = 0
    private(set) var invokedShowErrorParameters: (error: Error, Void)?
    private(set) var invokedShowErrorParametersList = [(error: Error, Void)]()

    func show(error: Error) {
        invokedShowError = true
        invokedShowErrorCount += 1
        invokedShowErrorParameters = (error, ())
        invokedShowErrorParametersList.append((error, ()))
    }

    private(set) var invokedShowLoading = false
    private(set) var invokedShowLoadingCount = 0

    func showLoading() {
        invokedShowLoading = true
        invokedShowLoadingCount += 1
    }

    private(set) var invokedRemoveLoading = false
    private(set) var invokedRemoveLoadingCount = 0
    
    func removeLoading() {
        invokedRemoveLoading = true
        invokedRemoveLoadingCount += 1
    }
}
