//
//  APIClientProtocol.swift
//  JobFinder
//
//  Created by Laksh Purbey on 16/06/26.
//

import Foundation

protocol APIClientProtocol {
    func request<T: Decodable>(
        _ endpoint: Endpoint
    ) async throws -> T
}
