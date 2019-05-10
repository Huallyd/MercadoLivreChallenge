//
//  Product.swift
//  MercadoLivreChallenge
//
//  Created by Huallyd Smadi on 08/05/19.
//  Copyright © 2019 Huallyd Smadi. All rights reserved.
//

import Foundation

struct Product {
    let id: String
    let title: String
    let price: Double
    let thumbnail: URL
    let currencyId: String
    let soldQuantity: Double
    let condition: CoditionProduct

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        id = try container.decode(String.self, forKey: .id)
        title = try container.decode(String.self, forKey: .title)
        price = (try? container.decode(Double.self, forKey: .price)) ?? 0
        thumbnail = try container.decode(URL.self, forKey: .thumbnail)
        currencyId = (try? container.decode(String.self, forKey: .currencyId)) ?? ""
        soldQuantity = try container.decode(Double.self, forKey: .soldQuantity)
        condition = CoditionProduct(rawValue: try container.decode(String.self, forKey: .condition)) ?? .notSpecified
    }
}

extension Product: Decodable {
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case price
        case thumbnail
        case currencyId = "currency_id"
        case condition
        case soldQuantity = "sold_quantity"
    }
}

struct ProductResult {
    let products: [Product]

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        products = try container.decode([Product].self, forKey: .products)
    }
}

extension ProductResult: Decodable {
    enum CodingKeys: String, CodingKey {
        case products = "results"
    }
}
