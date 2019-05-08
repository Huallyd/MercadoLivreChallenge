//
//  ProductService.swift
//  MercadoLivreChallenge
//
//  Created by Huallyd Smadi on 08/05/19.
//  Copyright © 2019 Huallyd Smadi. All rights reserved.
//

import Moya

enum ProductService {
    case search(searchedString: String)
}

extension ProductService: TargetType {
    var baseURL: URL {
        guard let url = URL(string: "https://api.mercadolibre.com/sites/MLU/") else {
            fatalError("baseURL could not be configured")
        }

        return url
    }

    var path: String {
        switch self {
        case .search: return "search"
        }
    }

    var method: Method {
        switch self {
        case .search: return .get
        }
    }

    var sampleData: Data {
        switch self {
        case .search: return Data()
        }
    }

    var task: Task {
        switch self {
        case .search(let searchedString): return .requestParameters(parameters: ["q": searchedString],
                                                                    encoding: URLEncoding.default)
        }
    }

    var headers: [String : String]? {
        return nil
    }
}
