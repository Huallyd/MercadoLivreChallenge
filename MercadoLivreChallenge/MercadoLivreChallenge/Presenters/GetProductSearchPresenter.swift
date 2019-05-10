//
//  GetProductSearchPresenter.swift
//  MercadoLivreChallenge
//
//  Created by Huallyd Smadi on 08/05/19.
//  Copyright © 2019 Huallyd Smadi. All rights reserved.
//

protocol GetProductSearchPresenter: EmptyPresenter, ErrorPresenter, LoadingPresenter {
    func show(products: [ProductViewModel])
}
