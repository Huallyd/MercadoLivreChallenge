//
//  ResponseError.swift
//  MercadoLivreChallenge
//
//  Created by Huallyd Smadi on 08/05/19.
//  Copyright © 2019 Huallyd Smadi. All rights reserved.
//

enum ResponseError: String, Error {
    case authenticationError = "You need to be authenticate first."
    case badRequest = "Bad Request."
    case noData = "Response returned with no data to decode."
    case failed = "Network request failed."
    case outdated = "The url you requested is outdated."
    case connection = "Please check your network connection."
    case unableToDecode = "We could not decode the response"
}
