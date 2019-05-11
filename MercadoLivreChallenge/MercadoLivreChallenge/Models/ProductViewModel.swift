//
//  ProductViewModel.swift
//  MercadoLivreChallenge
//
//  Created by Huallyd Smadi on 08/05/19.
//  Copyright © 2019 Huallyd Smadi. All rights reserved.
//

import Foundation
import UIKit

struct ProductViewModel {
    let title: String
    let price: String
    let currency: String
    let thumbnail: URL
    let soldQuantity: String
    let condition: String
    let status: String

    init(product: Product) {
        title = product.title
        price = String(format: "%.02f", product.price)
        currency = "\(product.currencyId)"
        thumbnail = product.thumbnail
        soldQuantity = "\(product.soldQuantity)"
        condition = product.condition.rawValue

        if product.condition.rawValue.isEmpty {
            status = product.soldQuantity == 0 ? "sem vendas" : "\(product.soldQuantity) vendidos"
        } else {
            status = product.soldQuantity == 0 ? "\(product.condition) - sem vendas"
                                               : "\(product.condition) - \(product.soldQuantity) vendidos"
        }
    }
}
