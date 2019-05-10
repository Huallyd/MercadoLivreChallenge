//
//  ProductViewStateView.swift
//  MercadoLivreChallenge
//
//  Created by Huallyd Smadi on 10/05/19.
//  Copyright © 2019 Huallyd Smadi. All rights reserved.
//

import UIKit

final class ProductViewStateView: UIView {
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        label.numberOfLines = 0

        return label
    }()

    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16)
        label.textAlignment = .center
        label.numberOfLines = 0

        return label
    }()

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleLabel, subtitleLabel])
        stackView.axis = .vertical
        stackView.spacing = 16

        return stackView
    }()

    // MARK: Initializer

    init(viewState: ProductViewState) {
        super.init(frame: .zero)

        setup(viewState: viewState)
        setupView()
        setupLayout()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Private functions

    private func setup(viewState: ProductViewState) {
        titleLabel.text = viewState.title
        subtitleLabel.text = viewState.subtitle
    }

    private func setupView() {
        backgroundColor = .silver
    }

    private func setupLayout() {
        addSubview(stackView, constraints: [
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).priority(.defaultLow),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor).priority(.defaultLow)
        ])

        titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor).priority(.defaultHigh).isActive = true
        subtitleLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }

    // MARK: Function

    func update(viewState: ProductViewState) {
        setup(viewState: viewState)
    }
}
