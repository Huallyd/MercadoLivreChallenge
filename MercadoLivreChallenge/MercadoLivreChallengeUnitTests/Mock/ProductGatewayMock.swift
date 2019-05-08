//
//  ProductGatewayMock.swift
//  MercadoLivreChallenge
//
//  Created by Huallyd Smadi on 08/05/19.
//  Copyright © 2019 Huallyd Smadi. All rights reserved.
//

@testable import MercadoLivreChallenge

final class ProductGatewayMock: ProductGateway {
    private(set) var invokedSearchProducts = false
    private(set) var invokedSearchProductsCount = 0
    private(set) var invokedSearchProductsParameters: (searchString: String, Void)?
    private(set) var invokedSearchProductsParametersList = [(searchString: String, Void)]()
    private(set) var stubbedSearchProductsCompletionResult: (Result<[Product]>, Void)?

    init(products: [Product]) {
        stubbedSearchProductsCompletionResult = (.success(products), ())
    }

    func searchProducts(_ searchString: String, completion: @escaping (Result<[Product]>) -> Void) {
        invokedSearchProducts = true
        invokedSearchProductsCount += 1
        invokedSearchProductsParameters = (searchString, ())
        invokedSearchProductsParametersList.append((searchString, ()))

        if let result = stubbedSearchProductsCompletionResult {
            completion(result.0)
        }
    }
}
