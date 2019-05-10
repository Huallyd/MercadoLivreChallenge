//
//  NSMutableAttributedString+LabelConfiguration.swift
//  MercadoLivreChallenge
//
//  Created by Huallyd Smadi on 09/05/19.
//  Copyright © 2019 Huallyd Smadi. All rights reserved.
//

import Foundation
import UIKit

typealias LabelConfiguration = (text: String, font: UIFont, color: UIColor)

extension NSMutableAttributedString {
    convenience init(configurations: [LabelConfiguration]) {
        self.init()
        
        configurations.forEach {
            append(NSAttributedString(string: $0.text, attributes: [.font: $0.font,
                                                                    .foregroundColor: $0.color]))

        }
    }
}

