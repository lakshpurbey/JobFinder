# JobFinder iOS Application

## Overview

JobFinder is a production-ready iOS application built using modern iOS development practices and architecture principles. The application allows users to:

* Browse available jobs
* Search jobs by title or company
* View detailed job information
* Handle loading, empty, and error states gracefully

The project demonstrates scalable architecture, clean separation of concerns, dependency injection, asynchronous networking, and comprehensive unit testing.


# Features

## Job Listing

Displays a list of available jobs including:

* Job Title
* Company Name
* Location
* Salary Range

## Search

Users can search jobs by:

* Job Title
* Company Name

Search results are updated dynamically.

## Job Details

Displays detailed information about a selected job:

* Job Description
* Company Information
* Job Location
* Salary Range

## State Management

The application supports:

* Loading State
* Empty State
* Error State
* Loaded State


# Technical Stack

| Technology           | Usage                  |
| -------------------- | ---------------------- |
| Swift 5.9+           | Programming Language   |
| SwiftUI              | User Interface         |
| MVVM                 | Architecture Pattern   |
| Async/Await          | Concurrency            |
| URLSession           | Networking             |
| XCTest               | Unit Testing           |
| Dependency Injection | Decoupled Architecture |


# Architecture

The application follows MVVM (Model-View-ViewModel) architecture with a layered design inspired by Clean Architecture principles.

```text

┌────────────────────┐
│       View         │
│ SwiftUI Screens    │
└─────────┬──────────┘
          │
          ▼
┌────────────────────┐
│     ViewModel      │
│ Presentation Layer │
└─────────┬──────────┘
          │
          ▼
┌────────────────────┐
│    Repository      │
│ Business Logic     │
└─────────┬──────────┘
          │
          ▼
┌────────────────────┐
│    API Client      │
│ Networking Layer   │
└─────────┬──────────┘
          │
          ▼
┌────────────────────┐
│ JSON / API Source  │
└────────────────────┘
```

# Project Structure

```text

JobFinder
│
├── App
│   └── JobFinderApp.swift
│
├── Presentation
│   ├── Views
│   │   ├── JobListView.swift
│   │   ├── JobDetailView.swift
│   │   └── JobRowView.swift
│   │
│   └── ViewModels
│       ├── JobListViewModel.swift
│       └── JobDetailViewModel.swift
│
├── Domain
│   ├── Models
│   │   └── Job.swift
│   │
│   └── Repositories
│       └── JobRepository.swift
│
├── Data
│   ├── DTO
│   │   └── JobDTO.swift
│   │
│   ├── Repository
│   │   └── JobRepositoryImpl.swift
│   │
│   ├── Networking
│   │   ├── APIClient.swift
│   │   ├── APIClientProtocol.swift
│   │   ├── Endpoint.swift
│   │   └── NetworkError.swift
│   │
│   └── Services
│       └── JobSearchService.swift
│
└── Tests
    ├── JobListViewModelTests.swift
    ├── JobRepositoryTests.swift
    └── MockObjects
    
    ```

# Architectural Decisions

## MVVM

MVVM was chosen because it:

* Provides clear separation of concerns
* Improves testability
* Reduces view complexity
* Supports SwiftUI data binding naturally


## Repository Pattern

The Repository layer abstracts data access from the presentation layer.

Benefits:

* Easy to replace API implementation
* Simplifies testing
* Supports future caching mechanisms

Example:

protocol JobRepository {
    func fetchJobs() async throws -> [Job]
}


## DTO Mapping

The application separates API models from Domain models.

### API Model

JobDTO

### Domain Model

Job

Benefits:

* Prevents API changes from impacting UI
* Allows domain-specific transformations
* Improves maintainability


## Dependency Injection

Dependencies are injected through initializers.

Example:

JobListViewModel(
    repository: repository,
    searchService: searchService
)

Benefits:

* Loose coupling
* Better testability
* Easier mocking


# Networking

The networking layer is generic and reusable.

protocol APIClientProtocol {
    func request<T: Decodable>(
        _ endpoint: Endpoint
    ) async throws -> T
}

Responsibilities:

* Execute HTTP requests
* Decode responses
* Error handling
* Response validation


# Search Implementation

Search is implemented in a dedicated service layer.

Supported filters:

* Job Title
* Company Name

Search is case-insensitive.

Example:

iOS
apple
developer

# Error Handling

The application handles:

enum NetworkError

Supported errors:

* Invalid URL
* Invalid Response
* Decoding Failure
* Network Failure

UI displays user-friendly error messages.


# State Management

The JobListViewModel exposes a finite state machine:

enum State {
    case idle
    case loading
    case loaded([Job])
    case empty
    case error(String)
}

Benefits:

* Predictable UI behavior
* Easier testing
* Clear screen states


# Unit Testing

Unit tests focus on business logic and ViewModel behavior.

Covered scenarios:

### JobListViewModel

* Successful job loading
* Empty response
* Error handling
* Search filtering
* Search reset
* No search results

### Repository

* Successful DTO mapping
* API failure handling
* Data transformation validation

# Test Coverage

Target Coverage:

70%+ Business Logic Coverage

Coverage primarily focuses on:

* ViewModels
* Repository Layer
* Search Logic
* Networking Abstractions


# Setup Instructions

## Prerequisites

* Xcode 16+
* iOS 17+
* Swift 5.9+


## Clone Repository

git clone <repository-url>

## Open Project

open JobFinder.xcodeproj

## Run Application

1. Select simulator
2. Press:

⌘ + R

## Run Tests

⌘ + U

or

xcodebuild test

# Assumptions Made

1. Job data is read from a mock JSON source.
2. Authentication is out of scope.
3. Pagination is not required for the assessment.
4. Offline persistence is not required.
5. Salary values are returned as integers.
6. Search operates on locally fetched jobs.
7. Search is case-insensitive.
8. Job details are available from the selected list item.
9. The API returns valid JSON structures.


# Future Enhancements

Potential production improvements:

* Server-side search
* Pagination / Infinite Scrolling
* Offline caching
* Core Data persistence
* Favorites / Saved Jobs
* Analytics & Monitoring
* Accessibility Audit
* Snapshot Testing
* CI/CD Integration
* Feature Flags
* Remote Configuration


# Scalability Considerations

The architecture has been designed to support:

* Additional job filters
* Multiple API providers
* Offline-first strategy
* Modularization
* Swift Package extraction
* Feature-based architecture

without significant refactoring.

# Author

Laksh Purbey
Senior / Lead iOS Engineer

Built using modern iOS engineering practices with a focus on scalability, maintainability, and testability.
