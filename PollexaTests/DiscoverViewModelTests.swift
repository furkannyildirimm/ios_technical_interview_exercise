//
//  PollexaTests.swift
//  PollexaTests
//
//  Created by Furkan Yıldırım on 20.05.2024.
//

import XCTest
@testable import Pollexa

class DiscoverViewModelTests: XCTestCase {

    var viewModel: DiscoverViewModel!
    var mockPostProvider: MockPostProvider!

    override func setUp() {
        super.setUp()
        mockPostProvider = MockPostProvider()
        viewModel = DiscoverViewModel(postProvider: mockPostProvider)
    }

    override func tearDown() {
        viewModel = nil
        mockPostProvider = nil
        super.tearDown()
    }

    func testFetchDataSuccess() {
        
        let defaultImage = UIImage()
        let user1 = User(id: "user_1", username: "Alice", image: defaultImage)
        let user2 = User(id: "user_2", username: "Beth", image: defaultImage)
        let user3 = User(id: "user_3", username: "Chris", image: defaultImage)
        let user4 = User(id: "user_4", username: "Diana", image: defaultImage)
        let user5 = User(id: "user_5", username: "Evan", image: defaultImage)
        
        let option1 = Post.Option(id: "option_1", image: defaultImage)
        let option2 = Post.Option(id: "option_2", image: defaultImage)
        
        let posts: [Post] = [
            Post(id: "post_1", createdAt: ISO8601DateFormatter().date(from: "2024-04-29T15:12:15Z")!, content: "Which dessert should I serve at my party?", options: [option1, option2], user: user1),
            Post(id: "post_2", createdAt: ISO8601DateFormatter().date(from: "2024-04-15T15:12:15Z")!, content: "Which car should I buy for my next vehicle?", options: [option1, option2], user: user3),
            Post(id: "post_3", createdAt: ISO8601DateFormatter().date(from: "2024-05-07T15:12:15Z")!, content: "Where should we go for our anniversary trip?", options: [option1, option2], user: user4),
            Post(id: "post_4", createdAt: ISO8601DateFormatter().date(from: "2024-05-07T15:12:15Z")!, content: "Which breed should we choose for our new family pet?", options: [option1, option2], user: user5),
            Post(id: "post_5", createdAt: ISO8601DateFormatter().date(from: "2024-05-02T15:12:15Z")!, content: "Which design should we choose for our new office layout?", options: [option1, option2], user: user3),
            Post(id: "post_6", createdAt: ISO8601DateFormatter().date(from: "2024-04-19T15:12:15Z")!, content: "Which guitar should I buy as a beginner?", options: [option1, option2], user: user1),
            Post(id: "post_7", createdAt: ISO8601DateFormatter().date(from: "2024-04-28T15:12:15Z")!, content: "What theme should we pick for the year-end company party?", options: [option1, option2], user: user2)
        ]
        
        mockPostProvider.mockResult = .success(posts)

        
        viewModel.fetchData()

        
        XCTAssertEqual(viewModel.postList.count, 7)
        XCTAssertEqual(viewModel.postList.first?.id, "post_1")
        XCTAssertEqual(viewModel.postList.first?.user.username, "Alice")
    }

    func testFetchDataFailure() {
        
        let error = NSError(domain: "TestError", code: 0, userInfo: nil)
        mockPostProvider.mockResult = .failure(error)

        
        viewModel.fetchData()

        
        XCTAssertTrue(viewModel.postList.isEmpty)
    }
}

