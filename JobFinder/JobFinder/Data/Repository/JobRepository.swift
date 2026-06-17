//
//  JobRepository.swift
//  JobFinder
//
//  Created by Laksh Purbey on 16/06/26.
//

protocol JobRepository {
    func fetchJobs() async throws -> [Job]
}
