//
//  GetProductSearchUseCase.swift
//  MercadoLivreChallenge
//
//  Created by Huallyd Smadi on 08/05/19.
//  Copyright © 2019 Huallyd Smadi. All rights reserved.
//

final class GetProductSearchUseCase {
    private let gateway: ProductGateway
    private unowned let presenter: GetProductSearchPresenter

    // MARK: Initializer

    init(gateway: ProductGateway, presenter: GetProductSearchPresenter) {
        self.gateway = gateway
        self.presenter = presenter
    }

    // MARK: Private Function

    private func onSuccess(products: [Product]) {
        guard !products.isEmpty else {
            return presenter.showEmpty()
        }

        presenter.show(products: products.map(ProductViewModel.init))
    }

    // MARK: Function

    func search(searchString: String) {
        gateway.searchProducts(searchString) { [weak self] result in
            switch result {
            case let .success(products): self?.onSuccess(products: products)
            case let .failure(error): self?.presenter.show(error: error)
            }
        }
    }
}
