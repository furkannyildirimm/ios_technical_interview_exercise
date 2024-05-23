//
//  PostCell.swift
//  Pollexa
//
//  Created by Furkan Yıldırım on 19.05.2024.
//

import UIKit

protocol PostCellDelegate: AnyObject {
    func pressedVote(model: Post, vote: Int)
}

final class PostCell: UITableViewCell {
    
    // MARK: - IBOUTLETS
    @IBOutlet private weak var userImage: UIImageView!
    @IBOutlet private weak var votesLabel: UILabel!
    @IBOutlet private weak var postSubtitleLabel: UILabel!
    @IBOutlet private weak var postTitleLabel: UILabel!
    @IBOutlet private weak var dateLabel: UILabel!
    @IBOutlet private weak var userName: UILabel!
    @IBOutlet private weak var firstOptionImageView: UIImageView!
    @IBOutlet private weak var secondaOptionImageView: UIImageView!
    @IBOutlet private weak var firstButton: UIButton!
    @IBOutlet private weak var secondButton: UIButton!
    @IBOutlet private weak var firstPercentageLabel: UILabel!
    @IBOutlet private weak var secondPercentageLabel: UILabel!
    
    // MARK: - PROPERTIES
    private var votesForOptionOne = 0
    private var votesForOptionTwo = 0
    private var lastVotedDate: Date?
    private var model: Post?
    
    weak var delegate: PostCellDelegate?

    private var totalVotes: Int {
        return votesForOptionOne + votesForOptionTwo
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        model = nil
        lastVotedDate = nil
        firstButton.isHidden = false
        secondButton.isHidden = false
        firstPercentageLabel.isHidden = true
        secondPercentageLabel.isHidden = true
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        firstOptionImageView.roundCorners(corners: [.bottomLeft, .topLeft], radius: 10)
        secondaOptionImageView.roundCorners(corners: [.bottomRight, .topRight], radius: 10)
    }
    
    func configure(model: Post){
        self.model = model
        postSubtitleLabel.text = model.content
        dateLabel.text = model.createdAt?.timeAgoDisplay()
        userName.text = model.user?.username
        userImage.image = model.user?.image
        firstOptionImageView.image = model.options?.first?.image
        secondaOptionImageView.image = model.options?.last?.image
        votesLabel.text = "\((model.optionOne ?? 0) + (model.optionTwo ?? 0)) Total Votes"
        updateLastVotedDateLabel()
        
        if model.isVoted ?? false {
            votesForOptionOne = model.optionOne ?? 0
            votesForOptionTwo = model.optionTwo ?? 0
            if let modelLastVotedDate = model.lastVotedDate {
                lastVotedDate = modelLastVotedDate
            }
            updateUI()
        }
    }
    
    @IBAction private func firstActionButton(_ sender: Any) {
        guard let model else { return }
        delegate?.pressedVote(model: model, vote: 1)
    }
    
    @IBAction private func secondActionButton(_ sender: Any) {
        guard let model else { return }
        delegate?.pressedVote(model: model, vote: 2)
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
        updateLastVotedDateLabel()
    }
    
    private func updateLastVotedDateLabel() {
        if let lastVotedDate = lastVotedDate {
            postTitleLabel.text = "Last voted \(lastVotedDate.timeAgoDisplay())".uppercased()
        } else {
            postTitleLabel.text = "No votes yet".uppercased()
        }
    }
    
    private func calculatePercentage(for votes: Int) -> Int {
        guard totalVotes > 0 else { return 0 }
        return Int((Double(votes) / Double(totalVotes)) * 100)
    }
}
