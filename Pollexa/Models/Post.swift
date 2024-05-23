//
//  Post.swift
//  Pollexa
//
//  Created by Emirhan Erdogan on 13/05/2024.
//

import UIKit

struct Post: Decodable {
    
    // MARK: - Properties
    let id: String?
    let createdAt: Date?
    let content: String?
    let options: [Option]?
    let user: User?
    var isVoted: Bool? = false
    var vote: Int?
    var lastVotedDate: Date?
    var optionOne: Int? = 0
    var optionTwo: Int? = 0
}
