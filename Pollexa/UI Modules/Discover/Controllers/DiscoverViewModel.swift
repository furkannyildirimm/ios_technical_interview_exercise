//
//  DiscoverViewModel.swift
//  Pollexa
//
//  Created by Furkan Yıldırım on 18.05.2024.
//


final class DiscoverViewModel {
    
    // MARK: - Properties
    private let postProvider: PostProviderProtocol

    var postList = [Post]()

    init(postProvider: PostProviderProtocol = PostProvider.shared) {
        self.postProvider = postProvider
    }

    func fetchData() {
        postProvider.fetchAll { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let posts):
                self.postList = posts

            case .failure(let error):
                debugPrint(error.localizedDescription)
            }
        }
    }
}

