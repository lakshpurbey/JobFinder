//
//  MockJobRepository.swift
//  JobFinder
//
//  Created by Laksh Purbey on 16/06/26.
//

import Foundation
@testable import JobFinder

final class MockJobRepository: JobRepository {

    var result: Result<[Job], Error> = .success([])

    func fetchJobs() async throws -> [Job] {
        switch result {
        case .success(let jobs):
            return jobs
        case .failure(let error):
            throw error
        }
    }
}
