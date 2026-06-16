//
//  JobRowView.swift
//  JobFinder
//
//  Created by Laksh Purbey on 16/06/26.
//

import SwiftUI

struct JobRowView: View {

    let job: Job

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {

            Text(job.title)
                .font(.headline)

            Text(job.company)
                .foregroundStyle(.secondary)

            Text(job.location)
                .font(.subheadline)

            Text("$\(job.salaryMin) - $\(job.salaryMax)")
                .font(.footnote)
                .foregroundStyle(.green)
        }
        .padding(.vertical, 4)
    }
}
