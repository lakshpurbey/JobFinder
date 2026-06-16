//
//  Untitled.swift
//  JobFinder
//
//  Created by Laksh Purbey on 16/06/26.
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

struct JobDTO: Codable {
    let id: String
    let title: String
    let company: String
    let location: String
    let salary_min: Int
    let salary_max: Int
    let description: String
    
    func toDomain() -> Job {
        Job(
            id: id,
            title: title,
            company: company,
            location: location,
            salaryMin: salary_min,
            salaryMax: salary_max,
            description: description
        )
    }
}
