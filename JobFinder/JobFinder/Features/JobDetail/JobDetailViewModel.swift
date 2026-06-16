//
//  JobDetailViewModel.swift
//  JobFinder
//
//  Created by Laksh Purbey on 16/06/26.
//

import Combine

final class JobDetailViewModel: ObservableObject {
    let job: Job
    
    init(job: Job) {
        self.job = job
    }
}

enum ViewState {
    case idle
    case loading
    case loaded(Job)
    case error(String)
}
