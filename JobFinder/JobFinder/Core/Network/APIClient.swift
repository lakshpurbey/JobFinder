//
//  APIClient.swift
//  JobFinder
//
//  Created by Laksh Purbey on 16/06/26.
//

import Foundation

final class APIClient: APIClientProtocol {

    func request<T: Decodable>(_ endpoint: Endpoint) async throws -> T {

        guard let url = Bundle.main.url(
            forResource: endpoint.localFileName,
            withExtension: "json"
        ) else {
            throw NetworkError.notFound
        }

        let data = try Data(contentsOf: url)

        return try JSONDecoder().decode(T.self, from: data)
    }
}
