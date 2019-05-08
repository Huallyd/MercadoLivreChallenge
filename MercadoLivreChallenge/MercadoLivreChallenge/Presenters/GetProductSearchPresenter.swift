//
//  GetProductSearchPresenter.swift
//  MercadoLivreChallenge
//
//  Created by Huallyd Smadi on 08/05/19.
//  Copyright © 2019 Huallyd Smadi. All rights reserved.
//

protocol GetProductSearchPresenter: EmptyPresenter, ErrorPresenter {
    func show(products: [ProductViewModel])
}

func weakSelfMethodReference<T: AnyObject, U>(_ valueForSelf: T,
                                              _ unbindedMethod: @escaping (T) -> (U) -> Void) -> ((U) -> Void) {
    return { [weak valueForSelf] (u: U) in
        if let valueForSelf = valueForSelf {
            unbindedMethod(valueForSelf)(u)
        }
    }
}
