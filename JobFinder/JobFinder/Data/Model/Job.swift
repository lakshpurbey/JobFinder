//
//  Job.swift
//  JobFinder
//
//  Created by Laksh Purbey on 17/06/26.
//

struct Job: Identifiable, Equatable {
    let id: String
    let title: String
    let company: String
    let location: String
    let salaryMin: Int
    let salaryMax: Int
    let description: String
}
