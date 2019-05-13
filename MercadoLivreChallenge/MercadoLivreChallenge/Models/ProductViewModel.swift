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

        let strings = R.string.viewModel.self

        if condition == "" {
            status = soldQuantity == "0" ? strings.noSales() : strings.quantitySales(soldQuantity)
        } else {
            status = soldQuantity == "0" ? strings.conditionWithNoSales(condition)
                                         : strings.conditionWithSales(condition, soldQuantity)
        }
    }
}
