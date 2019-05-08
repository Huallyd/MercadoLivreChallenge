//
//  Result.swift
//  MercadoLivreChallenge
//
//  Created by Huallyd Smadi on 08/05/19.
//  Copyright © 2019 Huallyd Smadi. All rights reserved.
//

enum Result<T> {
    case success(T)
    case failure(Error)
}

