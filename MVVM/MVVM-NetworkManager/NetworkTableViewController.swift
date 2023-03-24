//
//  NetworkTableViewController.swift
//  MVVM
//
//  Created by Adlet Zhantassov on 24.03.2023.
//

import UIKit

class NetworkTableViewController: UITableViewController {
    
    var viewModel: NetworkViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Table View"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        viewModel?.fetchMovies(completion: { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        })
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return viewModel.numberOfRowsInSection()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = viewModel?.titleForCell(atIndexPath: indexPath)
        return cell
    }

}
