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
    
    init(repository: JobRepository) {
        self.repository = repository
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
        guard !query.isEmpty else {
            state = .loaded(allJobs)
            return
        }
        
        let filtered = allJobs.filter {
            $0.title.localizedCaseInsensitiveContains(query) ||
            $0.company.localizedCaseInsensitiveContains(query)
        }
        
        state = filtered.isEmpty ? .empty : .loaded(filtered)
    }
}
