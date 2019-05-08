//
//  ProductListTableViewCell.swift
//  MercadoLivreChallenge
//
//  Created by Huallyd Smadi on 08/05/19.
//  Copyright © 2019 Huallyd Smadi. All rights reserved.
//

import UIKit
import Kingfisher

final class ProductListTableViewCell: UITableViewCell, Reusable {
    private let productImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .red

        return imageView
    }()

    private let titleLabel: UILabel = {
        let label = UILabel()

        return label
    }()

    private let priceLabel: UILabel = {
        let label = UILabel()

        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setupLayout()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupLayout() {
        addSubview(productImageView, constraints: [
            productImageView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            productImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            productImageView.heightAnchor.constraint(equalToConstant: 50),
            productImageView.widthAnchor.constraint(equalToConstant: 50)
        ])

        addSubview(titleLabel, constraints: [
            titleLabel.topAnchor.constraint(equalTo: productImageView.bottomAnchor, constant: 20),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])

        addSubview(priceLabel, constraints: [
            priceLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            priceLabel.centerXAnchor.constraint(equalTo: titleLabel.centerXAnchor)
        ])
    }

    func setup(viewModel: ProductViewModel) {
        titleLabel.text = viewModel.title
        priceLabel.text = "\(viewModel.price)"
        productImageView.kf.setImage(with: viewModel.thumbnail)
    }
}

