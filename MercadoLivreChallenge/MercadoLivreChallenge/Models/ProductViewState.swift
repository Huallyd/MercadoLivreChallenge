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
        case .initial: return R.string.stateView.titleInitial()
        case .empty: return R.string.stateView.titleEmpty()
        case .error: return R.string.stateView.titleError()
        }
    }

    var subtitle: String {
        switch self {
        case .initial: return R.string.stateView.subtitleInitial()
        case .empty: return R.string.stateView.subtitleEmpty()
        case let .error(description): return description
        }
    }
}

