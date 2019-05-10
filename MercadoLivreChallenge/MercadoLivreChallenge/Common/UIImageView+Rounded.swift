//
//  UIImageView+Rounded.swift
//  MercadoLivreChallenge
//
//  Created by Huallyd Smadi on 09/05/19.
//  Copyright © 2019 Huallyd Smadi. All rights reserved.
//

import UIKit

class RoundImage: UIImageView {
    override func layoutSubviews() {
        super.layoutSubviews()

        layer.cornerRadius = 22
        clipsToBounds = true
    }
}
