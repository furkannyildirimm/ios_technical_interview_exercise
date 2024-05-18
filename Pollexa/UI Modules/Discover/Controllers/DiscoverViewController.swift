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
        tableView.delegate = self
        tableView.dataSource = self
        
        // TODO: Extension olarak yazılacak.
        tableView.register(UINib(nibName: "PollCell", bundle: nil ), forCellReuseIdentifier: "PollCell")
        
    }
    
    private func addNavigationItem() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "blueHead"), style: .done, target: self, action: #selector(profileIconTapped))
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
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "PollCell") as? PollCell
        guard let cell = cell else { return UITableViewCell() }
        return cell
    }
    
    
}
