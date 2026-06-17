//
//  JobRepositoryImpl.swift
//  JobFinder
//
//  Created by Laksh Purbey on 17/06/26.
//

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
