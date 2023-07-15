//
//  View.swift
//  ViperExample
//
//  Created by Mehmet  on 14.07.2023.
//

import Foundation
import UIKit



protocol IUserView : ViewProtocol {
    func update(with users:[User])
    func update(with error : Error)
}

class UserViewController: UIViewController , IUserView {
    var presenter: any PresenterProtocol = UserPresenter()
    
    
    let tableView = UITableView()
        
    var users = [User]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor)
        ])
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = .blue
    }
    
    func update(with users: [User]) {
        Task { @MainActor in
          self.users = users
          tableView.reloadData()
        }
    }
    
    func update(with error: Error) {
        
    }
}



extension UserViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell",for: indexPath)
        cell.textLabel?.text = users[indexPath.row].name
        return cell
    
        
    }
    
    
}
