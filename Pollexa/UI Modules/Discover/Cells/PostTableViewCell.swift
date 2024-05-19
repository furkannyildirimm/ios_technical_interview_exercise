//
//  PostTableViewCell.swift
//  Pollexa
//
//  Created by STARK on 19.05.2024.
//

import UIKit

class PostTableViewCell: UITableViewCell {

    var postList = [Post]()
    @IBOutlet private weak var postTableView: UITableView!
    override func awakeFromNib() {
        super.awakeFromNib()
        postTableView.delegate = self
        postTableView.dataSource = self
        postTableView.register(UINib(nibName: "PostCell", bundle: nil ), forCellReuseIdentifier: "PostCell")
        
    }
}

extension PostTableViewCell: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell") as? PostCell
        guard let cell = cell else { return UITableViewCell() }
        cell.postSubtitleLabel.text = postList[indexPath.row].content
        return cell
    }
    
    
}
