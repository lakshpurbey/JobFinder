//
//  DIContainer.swift
//  JobFinder
//
//  Created by Laksh Purbey on 16/06/26.
//

final class DIContainer {
    
    static let shared = DIContainer()
    
    let apiClient: APIClientProtocol
    let jobRepository: JobRepository
    
    private init() {
        self.apiClient = APIClient()
        self.jobRepository = JobRepositoryImpl(api: apiClient)
    }
}
