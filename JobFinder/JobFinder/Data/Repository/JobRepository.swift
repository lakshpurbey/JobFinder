//
//  JobRepository.swift
//  JobFinder
//
//  Created by Laksh Purbey on 16/06/26.
//

protocol JobRepository {
    func fetchJobs() async throws -> [Job]
}

final class JobRepositoryImpl: JobRepository {
    private let api: APIClientProtocol
    
    init(api: APIClientProtocol) {
        self.api = api
    }
    
    func fetchJobs() async throws -> [Job] {
        let dtos: [JobDTO] = try await api.request(.jobs)
        return dtos.map { $0.toDomain() }
    }
}
