//
//  JobSearchService.swift
//  JobFinder
//
//  Created by Laksh Purbey on 17/06/26.
//

import Foundation

protocol JobSearchService {
    func filter(jobs: [Job], query: String) -> [Job]
}
