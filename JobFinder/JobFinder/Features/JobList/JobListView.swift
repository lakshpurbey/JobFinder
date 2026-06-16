//
//  JobListView.swift
//  JobFinder
//
//  Created by Laksh Purbey on 16/06/26.
//

import SwiftUI

struct JobListView: View {
    @StateObject var viewModel: JobListViewModel
    
    var body: some View {
        NavigationView {
            content
                .navigationTitle("Jobs")
        }
        .task {
            await viewModel.fetchJobs()
        }
    }
    
    @ViewBuilder
    private var content: some View {
        switch viewModel.state {
        case .idle, .loading:
            ProgressView("Loading...")
            
        case .empty:
            Text("No jobs found")
            
        case .error(let message):
            Text("Error: \(message)")
            
        case .loaded(let jobs):
            List(jobs) { job in

                NavigationLink {

                    JobDetailView(
                        viewModel: JobDetailViewModel(job: job)
                    )

                } label: {

                    JobRowView(job: job)
                }

            }
        }
    }
}
