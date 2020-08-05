//
//  TasksViewController.swift
//  ToDoListWithFireBase
//
//  Created by yurik on 8/3/20.
//  Copyright © 2020 yurik. All rights reserved.
//

import UIKit
import Firebase

class TasksViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var tableViewOutlet: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.backgroundColor = .clear
        cell.textLabel?.text = "Number of rows \(indexPath.row)"
        cell.textLabel?.textColor = .white
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()


    }
    @IBAction func addAction(_ sender: UIBarButtonItem) {
    }
    
    @IBAction func signOutTapped(_ sender: UIBarButtonItem) {
        do {
            try Auth.auth().signOut()
        } catch  {
            print(error.localizedDescription)
        }
        dismiss(animated: true, completion: nil)
    }
}
