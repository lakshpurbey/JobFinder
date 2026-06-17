//
//  JobMappingTests.swift
//  JobFinder
//
//  Created by Laksh Purbey on 16/06/26.
//

import XCTest
@testable import JobFinder

final class JobMappingTests: XCTestCase {

    func test_jobDTO_toDomain() {

        let dto = JobDTO(
            id: "1",
            title: "iOS Dev",
            company: "Apple",
            location: "USA",
            salary_min: 100,
            salary_max: 200,
            description: "Test"
        )

        let job = dto.toDomain()

        XCTAssertEqual(job.id, "1")
        XCTAssertEqual(job.title, "iOS Dev")
        XCTAssertEqual(job.company, "Apple")
    }
}
