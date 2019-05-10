//
//  LoadingPresenter.swift
//  MercadoLivreChallenge
//
//  Created by Huallyd Smadi on 10/05/19.
//  Copyright © 2019 Huallyd Smadi. All rights reserved.
//

import UIKit

protocol LoadingPresenter: class {
    func showLoading()
    func removeLoading()
}

extension LoadingPresenter where Self: UIViewController {
    func showLoading() {
        view.load()
    }

    func removeLoading() {
        view.unload()
    }
}


