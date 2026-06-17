//
//  JobListViewModelTests.swift
//  JobFinder
//
//  Created by Laksh Purbey on 17/06/26.
//

import XCTest
@testable import JobFinder

@MainActor
final class JobListViewModelTests: XCTestCase {

    // MARK: - Success case
    func test_fetchJobs_success_setsLoadedState() async {

        let mockRepo = MockJobRepository()

        mockRepo.result = .success([
            Job(
                id: "1",
                title: "iOS Developer",
                company: "Apple",
                location: "USA",
                salaryMin: 100,
                salaryMax: 200,
                description: "Build iOS apps"
            )
        ])
        
        let mockSearchService = MockJobSearchService()

        let vm = JobListViewModel(repository: mockRepo,
                                  searchService: mockSearchService)

        await vm.fetchJobs()

        guard case let .loaded(jobs) = vm.state else {
            XCTFail("Expected loaded state")
            return
        }

        XCTAssertEqual(jobs.count, 1)
        XCTAssertEqual(jobs.first?.title, "iOS Developer")
    }

    // MARK: - Empty case
    func test_fetchJobs_empty_setsEmptyState() async {

        let mockRepo = MockJobRepository()
        mockRepo.result = .success([])

        let mockSearchService = MockJobSearchService()

        let vm = JobListViewModel(repository: mockRepo,
                                  searchService: mockSearchService)

        await vm.fetchJobs()

        guard case .empty = vm.state else {
            XCTFail("Expected empty state")
            return
        }
    }

    // MARK: - Error case
    func test_fetchJobs_failure_setsErrorState() async {

        let mockRepo = MockJobRepository()
        mockRepo.result = .failure(NSError(domain: "Test", code: 500))

        let mockSearchService = MockJobSearchService()

        let vm = JobListViewModel(repository: mockRepo,
                                  searchService: mockSearchService)

        await vm.fetchJobs()

        guard case .error(let message) = vm.state else {
            XCTFail("Expected error state")
            return
        }

        XCTAssertFalse(message.isEmpty)
    }

    // MARK: - Search by title
    func test_search_filtersByTitle() async {

        let mockRepo = MockJobRepository()
        mockRepo.result = .success([
            Job(
                id: "1",
                title: "iOS Engineer",
                company: "Apple",
                location: "USA",
                salaryMin: 100,
                salaryMax: 200,
                description: "iOS"
            ),
            Job(
                id: "2",
                title: "Android Engineer",
                company: "Google",
                location: "USA",
                salaryMin: 100,
                salaryMax: 200,
                description: "Android"
            )
        ])

        let mockSearchService = MockJobSearchService()

        let vm = JobListViewModel(repository: mockRepo,
                                  searchService: mockSearchService)

        await vm.fetchJobs()

        vm.search(query: "iOS")

        guard case let .loaded(jobs) = vm.state else {
            XCTFail("Expected loaded state")
            return
        }

        XCTAssertEqual(jobs.count, 1)
        XCTAssertEqual(jobs.first?.title, "iOS Engineer")
    }

    // MARK: - Empty search restores all
    func test_search_empty_restoresAllJobs() async {

        let mockRepo = MockJobRepository()
        mockRepo.result = .success([
            Job(
                id: "1",
                title: "iOS Engineer",
                company: "Apple",
                location: "USA",
                salaryMin: 100,
                salaryMax: 200,
                description: "iOS"
            )
        ])

        let mockSearchService = MockJobSearchService()

        let vm = JobListViewModel(repository: mockRepo,
                                  searchService: mockSearchService)

        await vm.fetchJobs()

        vm.search(query: "")

        guard case let .loaded(jobs) = vm.state else {
            XCTFail("Expected loaded state")
            return
        }

        XCTAssertEqual(jobs.count, 1)
    }

    // MARK: - Search no results
    func test_search_noResults_setsEmptyState() async {

        let mockRepo = MockJobRepository()
        mockRepo.result = .success([
            Job(
                id: "1",
                title: "iOS Engineer",
                company: "Apple",
                location: "USA",
                salaryMin: 100,
                salaryMax: 200,
                description: "iOS"
            )
        ])

        let mockSearchService = MockJobSearchService()

        let vm = JobListViewModel(repository: mockRepo,
                                  searchService: mockSearchService)

        await vm.fetchJobs()

        vm.search(query: "Blockchain")

        guard case .empty = vm.state else {
            XCTFail("Expected empty state")
            return
        }
    }
}
