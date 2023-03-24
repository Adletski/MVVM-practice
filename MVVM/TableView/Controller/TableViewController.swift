//
//  TableViewController.swift
//  MVVM
//
//  Created by Adlet Zhantassov on 23.03.2023.
//

import UIKit

class TableViewController: UITableViewController {
    
    var profiles: [Profile]!
    
    var viewModel: TableViewViewModelType?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Table View"
        navigationController?.navigationBar.prefersLargeTitles = true
        tableView.register(ProfileTableViewCell.self, forCellReuseIdentifier: "cell")
        
//        profiles = [Profile(name: "John", secondName: "Smith", age: 33),
//                    Profile(name: "Max", secondName: "Kolby", age: 21),
//                    Profile(name: "Mark", secondName: "Salmon", age: 55)]
        viewModel = ViewModel2()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return viewModel?.numberOfRows() ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ProfileTableViewCell
        
        guard let tableViewCell = cell,
              let viewModel = viewModel else { return UITableViewCell() }
        
//        let profile = viewModel.profiles[indexPath.row]
//        tableViewCell.name.text = profile.name + " " + profile.secondName
//        tableViewCell.age.text = String(profile.age)
        
        let cellViewModel = viewModel.cellViewModel(forIndexPath: indexPath)
        tableViewCell.viewModel = cellViewModel
        
        return tableViewCell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        guard let viewModel = viewModel else { return }
        viewModel.selectRow(atIndexPath: indexPath)
        
        let detailVC = DetailViewController()
        detailVC.viewModel = viewModel.viewModelForSelectedRow()
        navigationController?.pushViewController(detailVC, animated: true)
    }
}
