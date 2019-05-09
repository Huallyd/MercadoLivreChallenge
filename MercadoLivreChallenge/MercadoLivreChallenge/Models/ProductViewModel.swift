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
    let price: NSAttributedString
    let thumbnail: URL
    let condition: String

    init(product: Product) {
        title = product.title
        thumbnail = product.thumbnail
        condition = product.condition.rawValue

        let formattedPrice = String(format: "%.02f", product.price)

        let intValue = formattedPrice.substring(toIndex: formattedPrice.count - 3)
        let cents = formattedPrice.substring(fromIndex: intValue.count)

        let configuration: [LabelConfiguration] = [
            (text: "\(product.currencyId) ", font: .boldSystemFont(ofSize: 14), color: .black),
            (text: "\(intValue)", font: .boldSystemFont(ofSize: 14), color: .black),
            (text: cents, font: .boldSystemFont(ofSize: 10), color: .black)
        ]

        price = NSMutableAttributedString(labelConfigurations: configuration)
    }
}
