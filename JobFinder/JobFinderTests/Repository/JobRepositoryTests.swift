//
//  JobRepositoryTests.swift
//  JobFinder
//
//  Created by Laksh Purbey on 16/06/26.
//

import XCTest
@testable import JobFinder

final class JobRepositoryTests: XCTestCase {

    func test_fetchJobs_success() async throws {

        let mockAPI = MockAPIClient()
        mockAPI.result = .success([
            JobDTO(
                id: "1",
                title: "iOS Dev",
                company: "TestCorp",
                location: "Remote",
                salary_min: 1000,
                salary_max: 2000,
                description: "Test job"
            )
        ])

        let repo = JobRepositoryImpl(api: mockAPI)

        let jobs = try await repo.fetchJobs()

        XCTAssertEqual(jobs.count, 1)
        XCTAssertEqual(jobs.first?.title, "iOS Dev")
    }

    func test_fetchJobs_failure() async {

        let mockAPI = MockAPIClient()
        mockAPI.result = .failure(NetworkError.notFound)

        let repo = JobRepositoryImpl(api: mockAPI)

        do {
            _ = try await repo.fetchJobs()
            XCTFail("Expected error")
        } catch {
            XCTAssertTrue(error is NetworkError)
        }
    }
}
