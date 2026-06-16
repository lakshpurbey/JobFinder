//
//  Endpoint.swift
//  JobFinder
//
//  Created by Laksh Purbey on 16/06/26.
//

import Foundation

enum Endpoint {

    case jobs
    case jobDetail(id: String)

    var localFileName: String {
        switch self {

        case .jobs:
            return "jobs"

        case .jobDetail(let id):
            return "job_\(id)"
        }
    }
}
