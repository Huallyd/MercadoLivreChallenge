//
//  NSLayoutConstraint+Priority.swift
//  MercadoLivreChallenge
//
//  Created by Huallyd Smadi on 10/05/19.
//  Copyright © 2019 Huallyd Smadi. All rights reserved.
//

import UIKit

extension NSLayoutConstraint {
    func priority(_ value: UILayoutPriority) -> NSLayoutConstraint {
        priority = value

        return self
    }
}
