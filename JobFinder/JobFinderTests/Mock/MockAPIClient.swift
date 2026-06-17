//
//  MockAPIClient.swift
//  JobFinder
//
//  Created by Laksh Purbey on 16/06/26.
//

final class MockAPIClient: APIClientProtocol {

    var result: Result<[JobDTO], Error>!

    func request<T>(_ endpoint: Endpoint) async throws -> T where T : Decodable {

        switch result {

        case .success(let jobs):
            return jobs as! T

        case .failure(let error):
            throw error

        case .none:
            throw NetworkError.invalidResponse
        }
    }
}
