//
//  JobSearchServiceTests.swift
//  JobFinder
//
//  Created by Laksh Purbey on 17/06/26.
//

import XCTest
@testable import JobFinder

final class JobSearchServiceTests: XCTestCase {

    func test_search_filters_by_title_and_company() {

        let service = JobSearchServiceImpl()

        let jobs = [
            Job(id: "1", title: "iOS Developer", company: "Apple", location: "", salaryMin: 0, salaryMax: 0, description: ""),
            Job(id: "2", title: "Android Developer", company: "Google", location: "", salaryMin: 0, salaryMax: 0, description: "")
        ]

        let result = service.filter(jobs: jobs, query: "Apple")

        XCTAssertEqual(result.count, 1)
        XCTAssertEqual(result.first?.company, "Apple")
    }
}
