//
//  PostCell.swift
//  Pollexa
//
//  Created by STARK on 18.05.2024.
//

import UIKit

class PostCell: UITableViewCell {

    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var votesLabel: UILabel!
    @IBOutlet weak var optionImageViewTwo: UIImageView!
    @IBOutlet weak var optionImageViewOne: UIImageView!
    @IBOutlet weak var postSubtitleLabel: UILabel!
    @IBOutlet weak var postTitleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var avatarName: UILabel!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}
