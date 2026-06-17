//
//  JobDetailViewModelTests.swift
//  JobFinder
//
//  Created by Laksh Purbey on 16/06/26.
//

import XCTest
@testable import JobFinder

final class JobDetailViewModelTests: XCTestCase {

    @MainActor func test_init_storesJob() {
        let job = JobFinder.Job(
            id: "123",
            title: "Senior iOS Engineer",
            company: "Acme Corp",
            location: "Remote",
            salaryMin: 150_000,
            salaryMax: 200_000,
            description: "Build amazing iOS apps"
        )

        let sut = JobDetailViewModel(job: job)

        XCTAssertEqual(sut.job, job)
    }
}

