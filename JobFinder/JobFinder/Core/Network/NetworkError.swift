//
//  NetworkError.swift
//  JobFinder
//
//  Created by Laksh Purbey on 16/06/26.
//

import Foundation

enum NetworkError: LocalizedError {
    case invalidURL
    case invalidResponse
    case unauthorized
    case forbidden
    case notFound
    case serverError(statusCode: Int)
    case decodingError
    case noInternet
    case timeout
    case unknown(Error)
}
