//
//  ProductMock.swift
//  MercadoLivreChallenge
//
//  Created by Huallyd Smadi on 08/05/19.
//  Copyright © 2019 Huallyd Smadi. All rights reserved.
//

import Foundation

@testable import MercadoLivreChallenge

struct ProductMock {
    static let searchedProducts = try? JSONDecoder().decode(ProductResult.self, from: MapperHelper.dataJSON(file: "searched_products")).products
}
