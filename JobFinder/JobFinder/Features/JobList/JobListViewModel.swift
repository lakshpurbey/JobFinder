//
//  JobListViewModel.swift
//  JobFinder
//
//  Created by Laksh Purbey on 16/06/26.
//

import Foundation
import Combine

@MainActor
final class JobListViewModel: ObservableObject {
    
    enum State {
        case idle
        case loading
        case loaded([Job])
        case empty
        case error(String)
    }
    
    @Published private(set) var state: State = .idle
    
    private let repository: JobRepository
    private var allJobs: [Job] = []
    
    private let searchService: JobSearchService
    
    init(repository: JobRepository, searchService: JobSearchService) {
        self.repository = repository
        self.searchService = searchService
    }
    
    func fetchJobs() async {
        state = .loading
        
        do {
            let jobs = try await repository.fetchJobs()
            self.allJobs = jobs
            
            state = jobs.isEmpty ? .empty : .loaded(jobs)
        } catch {
            state = .error(error.localizedDescription)
        }
    }
    
    func search(query: String) {

        let filtered = searchService.filter(jobs: allJobs, query: query)
        
        state = filtered.isEmpty ? .empty : .loaded(filtered)
    }
}
