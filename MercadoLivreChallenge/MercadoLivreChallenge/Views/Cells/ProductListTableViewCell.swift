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
        imageView.contentMode = .scaleAspectFit

        return imageView
    }()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 14)

        return label
    }()

    private let priceLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 14)

        return label
    }()

    private let conditionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.font = .systemFont(ofSize: 10)

        return label
    }()

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [conditionLabel, titleLabel, priceLabel])
        stackView.axis = .vertical
        stackView.spacing = 6

        return stackView
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
            productImageView.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            productImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            productImageView.heightAnchor.constraint(equalToConstant: 70),
            productImageView.widthAnchor.constraint(equalToConstant: 70)
        ])

        addSubview(stackView, constraints: [
            stackView.topAnchor.constraint(equalTo: productImageView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: productImageView.trailingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
        ])
    }

    func setup(viewModel: ProductViewModel) {
        titleLabel.text = viewModel.title
        priceLabel.text = "\(viewModel.currency) \(viewModel.price)"
        conditionLabel.text = viewModel.condition
        productImageView.kf.setImage(with: viewModel.thumbnail,
                                     placeholder: UIImage(named: "placeholder_product"))
    }
}

