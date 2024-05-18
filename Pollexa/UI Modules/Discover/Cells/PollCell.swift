//
//  PollCell.swift
//  Pollexa
//
//  Created by STARK on 18.05.2024.
//

import UIKit

class PollCell: UITableViewCell {

    @IBOutlet private weak var titleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        titleLabel.textColor = .white
//        self.contentView.bringSubviewToFront(titleLabel)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
