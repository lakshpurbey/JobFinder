//
//  MockJobRepository.swift
//  JobFinder
//
//  Created by Laksh Purbey on 16/06/26.
//

import Foundation
@testable import JobFinder

final class MockJobRepository: JobRepository {

    var jobs: [Job] = []
    var error: Error?

    func fetchJobs() async throws -> [Job] {

        if let error {
            throw error
        }

        return jobs
    }
}
