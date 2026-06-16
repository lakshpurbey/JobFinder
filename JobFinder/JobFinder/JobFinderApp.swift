//
//  JobFinderApp.swift
//  JobFinder
//
//  Created by Laksh Purbey on 16/06/26.
//

import SwiftUI

@main
struct JobFinderApp: App {
    
    let container = DIContainer.shared

    var body: some Scene {
        WindowGroup {
            JobListView(
                    viewModel: JobListViewModel(
                    repository: container.jobRepository
                    )
                )
        }
    }
}
