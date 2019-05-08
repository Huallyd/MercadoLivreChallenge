//
//  ProductGateway.swift
//  MercadoLivreChallenge
//
//  Created by Huallyd Smadi on 08/05/19.
//  Copyright © 2019 Huallyd Smadi. All rights reserved.
//

protocol ProductGateway {
    func searchProducts(_ searchString: String, completion: @escaping (Result<[Product]>) -> Void)
}
