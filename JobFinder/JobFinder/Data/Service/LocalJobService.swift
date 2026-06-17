//
//  LocalJobService.swift
//  JobFinder
//
//  Created by Laksh Purbey on 16/06/26.
//

import Foundation

final class LocalJobService {

    func fetchJobs() async throws -> [JobDTO] {

        guard let url = Bundle.main.url(
            forResource: "jobs",
            withExtension: "json"
        ) else {
            throw NetworkError.notFound
        }

        let data = try Data(contentsOf: url)

        return try JSONDecoder()
            .decode([JobDTO].self, from: data)
    }
}
