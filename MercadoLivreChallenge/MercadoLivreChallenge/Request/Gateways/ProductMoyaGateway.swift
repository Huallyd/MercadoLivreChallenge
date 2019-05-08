//
//  ProductMoyaGateway.swift
//  MercadoLivreChallenge
//
//  Created by Huallyd Smadi on 08/05/19.
//  Copyright © 2019 Huallyd Smadi. All rights reserved.
//

import Moya

final class ProductMoyaGateway {
    private let provider = MoyaProvider<ProductService>()
}

extension ProductMoyaGateway: ProductGateway {
    func searchProducts(_ searchString: String, completion: @escaping (Result<[Product]>) -> Void) {
        provider.request(.search(searchedString: searchString)) { (moyaResult) in
            let result: Result<[Product]>

            switch moyaResult {
            case let .success(value):
                do {
                    let response = try JSONDecoder().decode(ProductResult.self, from: value.data)
                    result = .success(response.products)
                } catch {
                    result = .failure(error)
                }
            case let .failure(error): result = .failure(error)
            }

            completion(result)
        }
    }
}
