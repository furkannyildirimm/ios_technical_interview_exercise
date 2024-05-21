//
//  DiscoverViewController.swift
//  Pollexa
//
//  Created by Emirhan Erdogan on 13/05/2024.
//

import UIKit

final class DiscoverViewController: UIViewController {
    
    // MARK: - Properties
    private var discoverViewModel = DiscoverViewModel()
    
    // MARK: - @IBOutlet
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        addNavigationItem()
        discoverViewModel.fetchData()
        setupTableView()
        configureTableView()
    }
    
    private func addNavigationItem() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "userImage")?.withRenderingMode(.alwaysOriginal),style: .done,target: self,action: #selector(profileIconTapped))
    }
    
    private func setupTableView() {
        tableView.register(cellType: PollCell.self)
        tableView.register(cellType: PostCell.self)
    }
    
    private func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.showsVerticalScrollIndicator = false
        tableView.reloadData()
        
    }
    
    @objc private func addTapped() {
        // TODO: - Goto add poll option Page
    }
    
    @objc private func profileIconTapped() {
        // TODO: - Goto Profile Page
    }
}

extension DiscoverViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1 + discoverViewModel.postList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        if indexPath.row == 0 {
            if let pollCell = tableView.dequeueReusableCell(withIdentifier: "PollCell") as? PollCell {
                return pollCell
            }
        } else {
            if let postCell = tableView.dequeueReusableCell(withIdentifier: "PostCell") as? PostCell {
                postCell.configure(model: discoverViewModel.postList[indexPath.row - 1])
                return postCell
            }
        }
        return cell
    }
}
