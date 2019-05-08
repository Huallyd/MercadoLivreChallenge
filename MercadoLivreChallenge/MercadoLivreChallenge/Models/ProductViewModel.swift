//
//  ProductViewModel.swift
//  MercadoLivreChallenge
//
//  Created by Huallyd Smadi on 08/05/19.
//  Copyright © 2019 Huallyd Smadi. All rights reserved.
//

import Foundation

struct ProductViewModel {
    let title: String
    let price: Double
    let thumbnail: URL

    init(product: Product) {
        self.price = product.price
        self.title = product.title
        self.thumbnail = product.thumbnail
    }
}
