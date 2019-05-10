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

    // MARK: Private Functions

    private func onSuccess(products: [Product]) {
        if !products.isEmpty {
            presenter.show(products: products.map(ProductViewModel.init))
        } else {
            presenter.showEmpty()
        }

        presenter.removeLoading()
    }

    private func onError(error: Error) {
        presenter.show(error: error)
        presenter.removeLoading()
    }

    // MARK: Function

    func search(searchString: String) {
        presenter.showLoading()

        gateway.searchProducts(searchString) { [weak self] result in
            switch result {
            case let .success(products): self?.onSuccess(products: products)
            case let .failure(error): self?.onError(error: error)
            }
        }
    }
}
