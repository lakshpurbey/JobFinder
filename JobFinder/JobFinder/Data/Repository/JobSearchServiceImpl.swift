//
//  JobSearchServiceImpl.swift
//  JobFinder
//
//  Created by Laksh Purbey on 17/06/26.
//

import Foundation

final class JobSearchServiceImpl: JobSearchService {

    func filter(jobs: [Job], query: String) -> [Job] {

        let trimmedQuery = query.trimmingCharacters(in: .whitespacesAndNewlines)

        guard !trimmedQuery.isEmpty else {
            return jobs
        }

        return jobs.filter {
            $0.title.localizedCaseInsensitiveContains(trimmedQuery) ||
            $0.company.localizedCaseInsensitiveContains(trimmedQuery)
        }
    }
}
