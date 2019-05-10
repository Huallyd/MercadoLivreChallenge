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
    static func make(text: String) -> UILabel {
        let label = UILabel()
        let intValue = text.substring(toIndex: text.count - 3)
        let cents = text.substring(fromIndex: intValue.count)

        let configuration: [LabelConfiguration] = [
            (text: "\(intValue)", font: .boldSystemFont(ofSize: 20), color: .black),
            (text: cents, font: .boldSystemFont(ofSize: 16), color: .black)
        ]

        label.attributedText =  NSMutableAttributedString(labelConfigurations: configuration)

        return label
    }
}
