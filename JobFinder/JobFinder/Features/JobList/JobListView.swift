//
//  JobListView.swift
//  JobFinder
//
//  Created by Laksh Purbey on 16/06/26.
//

import SwiftUI

struct JobListView: View {
    @StateObject var viewModel: JobListViewModel
    
    @State private var searchText: String = ""
    
    var body: some View {
        NavigationView {

            content
                .navigationTitle("Jobs")
                .navigationBarTitleDisplayMode(.large)
                                .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .automatic))
                                .onChange(of: searchText) { _, newValue in
                                    handleSearch(newValue)
                                }
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
    
    // MARK: - Search Handler (debounce safe)
    private func handleSearch(_ text: String) {

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            guard text == searchText else { return } // cancel stale updates
            viewModel.search(query: text)
        }
    }

}
