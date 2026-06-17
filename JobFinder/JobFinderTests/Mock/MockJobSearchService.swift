//
//  MockJobSearchService.swift
//  JobFinder
//
//  Created by Laksh Purbey on 17/06/26.
//

import Foundation
@testable import JobFinder

final class MockJobSearchService: JobSearchService {

    func filter(jobs: [Job], query: String) -> [Job] {
        let q = query.lowercased()

        guard !q.isEmpty else { return jobs }

        return jobs.filter {
            $0.title.lowercased().contains(q) ||
            $0.company.lowercased().contains(q)
        }
    }
}
