//
//  ProductDetailViewController.swift
//  MercadoLivreChallenge
//
//  Created by Huallyd Smadi on 08/05/19.
//  Copyright © 2019 Huallyd Smadi. All rights reserved.
//

import UIKit

final class ProductDetailViewController: UIViewController {
    private let productImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit

        return imageView
    }()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0

        return label
    }()

    private let priceLabel: UILabel = {
        let label = UILabel()

        return label
    }()

    init(viewModel: ProductViewModel) {
        super.init(nibName: nil, bundle: nil)

        setup(viewModel: viewModel)
        setupLayout()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup(viewModel: ProductViewModel) {
        titleLabel.text = viewModel.title
        priceLabel.text = "\(viewModel.price)"
        productImageView.kf.setImage(with: viewModel.thumbnail)
    }

    private func setupLayout() {
        view.addSubview(productImageView, constraints: [
            productImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            productImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            productImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            productImageView.heightAnchor.constraint(equalToConstant: 80)
        ])

        view.addSubview(titleLabel, constraints: [
            titleLabel.topAnchor.constraint(equalTo: productImageView.bottomAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 12)
        ])

        view.addSubview(priceLabel, constraints: [
            priceLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            priceLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor)
        ])
    }
}
