//
//  DiscoverViewModel.swift
//  Pollexa
//
//  Created by Furkan Yıldırım on 18.05.2024.
//


final class DiscoverViewModel {

    // MARK: - Properties
    private let postProvider = PostProvider.shared
    
    var postList = [Post]()
    
    func fetchData() {
        postProvider.fetchAll { result in
            switch result {
            case .success(let posts):
                postList = posts
                
            case .failure(let error):
                debugPrint(error.localizedDescription)
            }
        }
    }
}
