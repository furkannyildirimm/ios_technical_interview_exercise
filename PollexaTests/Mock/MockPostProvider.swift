//
//  MockPostProvider.swift
//  PollexaTests
//
//  Created by Furkan Yıldırım on 21.05.2024.
//

import XCTest
@testable import Pollexa

class MockPostProvider: PostProviderProtocol {

    var mockResult: Result<[Post], Error>?

    func fetchAll(completion: (_ result: Result<[Post], Error>) -> Void) {
        if let result = mockResult {
            completion(result)
        } else {
            completion(.failure(NSError(domain: "Mock result not set", code: 0)))
        }
    }
}
