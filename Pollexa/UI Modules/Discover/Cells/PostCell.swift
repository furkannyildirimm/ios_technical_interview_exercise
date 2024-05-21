//
//  PostCell.swift
//  Pollexa
//
//  Created by Furkan Yıldırım on 19.05.2024.
//

import UIKit

class PostCell: UITableViewCell {
    
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var votesLabel: UILabel!
    @IBOutlet weak var postSubtitleLabel: UILabel!
    @IBOutlet weak var postTitleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var firstOptionImageView: UIImageView!
    @IBOutlet weak var secondaOptionImageView: UIImageView!
    @IBOutlet private weak var firstButton: UIButton!
    @IBOutlet private weak var secondButton: UIButton!
    @IBOutlet private weak var firstPercentageLabel: UILabel!
    @IBOutlet private weak var secondPercentageLabel: UILabel!
    
    private var votesForOptionOne = 0
    private var votesForOptionTwo = 0
    private var totalVotes: Int {
        return votesForOptionOne + votesForOptionTwo
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        firstOptionImageView.roundCorners(corners: [.bottomLeft, .topLeft], radius: 10)
        secondaOptionImageView.roundCorners(corners: [.bottomRight, .topRight], radius: 10)
    }
    
    func configure(model: Post){
        postSubtitleLabel.text = model.content
        dateLabel.text = model.createdAt.timeAgoDisplay()
        userName.text = model.user.username
        userImage.image = model.user.image
        firstOptionImageView.image = model.options.first?.image
        secondaOptionImageView.image = model.options.last?.image
        votesLabel.text = "\(totalVotes) Total Votes"
        
    }
    
    @IBAction private func firstActionButton(_ sender: Any) {
        
        self.votesForOptionOne += 1
        self.updateUI()
    }
    
    @IBAction private func secondActionButton(_ sender: Any) {
        
        self.votesForOptionTwo += 1
        self.updateUI()
    }
    
    
    private func updateUI() {
        
        let percentageOne = calculatePercentage(for: votesForOptionOne)
        let percentageTwo = calculatePercentage(for: votesForOptionTwo)
        
        firstButton.isHidden = true
        secondButton.isHidden = true
        
        firstPercentageLabel.isHidden = false
        secondPercentageLabel.isHidden = false
        
        firstPercentageLabel.text = "\(percentageOne)%"
        secondPercentageLabel.text = "\(percentageTwo)%"
        votesLabel.text = "\(totalVotes) Total Votes"
        
    }
    
    private func calculatePercentage(for votes: Int) -> Int {
        guard totalVotes > 0 else { return 0 }
        return Int((Double(votes) / Double(totalVotes)) * 100)
    }
}
