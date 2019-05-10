//
//  PriceLabelFactory.swift
//  MercadoLivreChallenge
//
//  Created by Huallyd Smadi on 09/05/19.
//  Copyright © 2019 Huallyd Smadi. All rights reserved.
//

import Foundation
import UIKit

final class PriceLabelFactory {
    static func make(currency: String, price: String) -> UILabel {
        let label = UILabel()
        let intValue = price.substring(toIndex: price.count - 3)
        let cents = price.substring(fromIndex: intValue.count)

        let configurations: [LabelConfiguration] = [
            (text: "\(currency) ", font: .systemFont(ofSize: 20), color: .black),
            (text: intValue, font: .boldSystemFont(ofSize: 20), color: .black),
            (text: cents, font: .boldSystemFont(ofSize: 16), color: .black)
        ]

        label.attributedText =  NSMutableAttributedString(configurations: configurations)

        return label
    }
}
