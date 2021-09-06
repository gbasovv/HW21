//
//  UsersTVC.swift
//  HW21
//
//  Created by Powroli on 23.07.21.
//

import UIKit

class UsersTVC: UITableViewController {

    private let jsonUrl = "https://jsonplaceholder.typicode.com/users"

    var users: [User] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "ShowDetail" else { return }
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        let detail = segue.destination as! DetailUsersVC
        detail.index = indexPath.row
        detail.user = users[indexPath.row]
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 108
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! UsersCell
        let user = users[indexPath.row]
        cell.configure(with: user)
        return cell
    }

    private func fetchData() {
        guard let url = URL(string: jsonUrl) else { return }
        let task = URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let data = data else { return }
            do {
                self.users = try JSONDecoder().decode([User].self, from: data)
            } catch {
                print(error)
            }
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        task.resume()
    }
}
