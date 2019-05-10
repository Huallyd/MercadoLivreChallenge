//
//  RoundImageView.swift
//  MercadoLivreChallenge
//
//  Created by Huallyd Smadi on 09/05/19.
//  Copyright © 2019 Huallyd Smadi. All rights reserved.
//

import UIKit

final class RoundImageView: UIImageView {
    private let cornerRadius: CGFloat?

    init(cornerRadius: CGFloat? = nil) {
        self.cornerRadius = cornerRadius

        super.init(frame: .zero)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        if let cornerRadius = cornerRadius {
            layer.cornerRadius = cornerRadius
        } else {
            layer.cornerRadius = frame.width / 2
        }

        clipsToBounds = true
    }
}
