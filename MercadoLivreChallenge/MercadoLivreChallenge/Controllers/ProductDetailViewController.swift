//
//  ProductDetailViewController.swift
//  MercadoLivreChallenge
//
//  Created by Huallyd Smadi on 08/05/19.
//  Copyright © 2019 Huallyd Smadi. All rights reserved.
//

import UIKit

final class ProductDetailViewController: UIViewController {
    private lazy var productImageView: RoundImage = {
        let imageView = RoundImage()
        imageView.contentMode = .scaleAspectFit
        imageView.kf.setImage(with: viewModel.thumbnail)

        return imageView
    }()

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = viewModel.title
        label.font = .boldSystemFont(ofSize: 20)
        label.numberOfLines = 0
        label.textAlignment = .center

        return label
    }()

    private let containerImageView: RoundImage = {
        let view = RoundImage()
        view.backgroundColor = .white

        return view
    }()

    private lazy var soldQuantityLabel: UILabel = {
        let label = UILabel()
        label.text = viewModel.soldQuantity

        return label
    }()

    private lazy var priceLabel = PriceLabelFactory.make(text: viewModel.price)

    private let viewModel: ProductViewModel

    // MARK: Initialize

    init(viewModel: ProductViewModel) {
        self.viewModel = viewModel

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Life Cycle

    override func loadView() {
        super.loadView()

        setupView()
        setupLayout()
    }

    // MARK: Private functions

    private func setupView() {
        view.backgroundColor = .lightgray
    }

    private func setupLayout() {
        view.addSubview(containerImageView, constraints: [
            containerImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            containerImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            containerImageView.heightAnchor.constraint(equalToConstant: 130),
            containerImageView.widthAnchor.constraint(equalToConstant: 130)
        ])

        view.addSubview(productImageView, constraints: [
            productImageView.topAnchor.constraint(equalTo: containerImageView.topAnchor, constant: 10),
            productImageView.leadingAnchor.constraint(equalTo: containerImageView.leadingAnchor, constant: 10),
            productImageView.trailingAnchor.constraint(equalTo: containerImageView.trailingAnchor, constant: -10),
            productImageView.bottomAnchor.constraint(equalTo: containerImageView.bottomAnchor, constant: -10)
        ])

        view.addSubview(titleLabel, constraints: [
            titleLabel.topAnchor.constraint(equalTo: containerImageView.bottomAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
//
//        view.addSubview(soldQuantityLabel, constraints: [
//            
//
//        ])
        
        view.addSubview(priceLabel, constraints: [
            priceLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            priceLabel.centerXAnchor.constraint(equalTo: titleLabel.centerXAnchor)
        ])
    }
}
