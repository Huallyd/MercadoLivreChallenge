//
//  ProductViewState.swift
//  MercadoLivreChallenge
//
//  Created by Huallyd Smadi on 10/05/19.
//  Copyright © 2019 Huallyd Smadi. All rights reserved.
//

import Foundation

enum ProductViewState {
    case initial
    case empty
    case error(description: String)

    var title: String {
        switch self {
        case .initial: return "Olá! :)"
        case .empty: return "Infelizmente não achamos o que você procura :("
        case .error: return "Ops, ocorreu um erro."
        }
    }

    var subtitle: String {
        switch self {
        case .initial: return "O que procura? \n\n Basta digitar na barra de busca."
        case .empty: return "Tente novamente com outro produto."
        case let .error(description): return description
        }
    }
}

