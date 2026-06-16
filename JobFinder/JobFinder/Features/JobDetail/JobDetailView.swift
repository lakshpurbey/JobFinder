//
//  JobDetailView.swift
//  JobFinder
//
//  Created by Laksh Purbey on 16/06/26.
//

import SwiftUI

struct JobDetailView: View {

    @StateObject private var viewModel: JobDetailViewModel

    init(viewModel: JobDetailViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {

                headerSection

                Divider()

                descriptionSection

                Divider()

                companySection

                Divider()

                locationSection
            }
            .padding()
        }
        .navigationTitle("Job Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

// MARK: - Sections

private extension JobDetailView {

    var headerSection: some View {
        VStack(alignment: .leading, spacing: 8) {

            Text(viewModel.job.title)
                .font(.title2)
                .fontWeight(.bold)

            Text(viewModel.job.company)
                .font(.headline)
                .foregroundStyle(.secondary)

            salaryView
        }
    }

    var salaryView: some View {
        HStack {
            Image(systemName: "dollarsign.circle.fill")

            Text(
                "$\(viewModel.job.salaryMin) - $\(viewModel.job.salaryMax)"
            )
        }
        .font(.subheadline)
        .foregroundStyle(.green)
    }

    var descriptionSection: some View {
        VStack(alignment: .leading, spacing: 12) {

            Text("Job Description")
                .font(.headline)

            Text(viewModel.job.description)
                .font(.body)
        }
    }

    var companySection: some View {
        VStack(alignment: .leading, spacing: 12) {

            Text("Company")
                .font(.headline)

            Text(viewModel.job.company)
                .font(.body)
        }
    }

    var locationSection: some View {
        VStack(alignment: .leading, spacing: 12) {

            Text("Location")
                .font(.headline)

            Label(
                viewModel.job.location,
                systemImage: "mappin.and.ellipse"
            )
        }
    }
}
