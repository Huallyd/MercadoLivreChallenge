//
//  MapperHelper.swift
//  MercadoLivreChallenge
//
//  Created by Huallyd Smadi on 08/05/19.
//  Copyright © 2019 Huallyd Smadi. All rights reserved.
//

import UIKit

final class MapperHelper {
    static func dataJSON(file: String) -> Data {
        let bundle = Bundle(for: MapperHelper.self)
        let path = bundle.path(forResource: file, ofType: "json")!
        let url = URL(fileURLWithPath: path)

        guard let data = try? Data(contentsOf: url, options: .alwaysMapped) else {
            assertionFailure("We cannot load data from this file: \(file)")

            return Data()
        }

        return data
    }
}
//
//extension Array where Element: Decodable {
//    init(file: String) {
//        self = []
//
//        if let data =
//    }
//}
