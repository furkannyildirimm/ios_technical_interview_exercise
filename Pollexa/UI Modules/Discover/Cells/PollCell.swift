//
//  PollCell.swift
//  Pollexa
//
//  Created by Furkan Yıldırım on 18.05.2024.
//

import UIKit

final class PollCell: UITableViewCell {
    
    @IBOutlet private weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(pollCount:Int) {
        titleLabel.text = "\(pollCount) Active Polls"
    }
}
