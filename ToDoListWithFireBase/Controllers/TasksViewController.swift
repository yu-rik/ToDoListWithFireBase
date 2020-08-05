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
       //создаем алерт контроллер
        let alertContr = UIAlertController(title: "New task", message: "Add new task", preferredStyle: .alert)
       //добавляем текстовое поле
        alertContr.addTextField()
        
        //добавляем две кнопки сохранить и отменить
        let save = UIAlertAction(title: "Save", style: .default) { _  in
            guard let textField = alertContr.textFields?.first, textField.text != "" else {return}
            //создание задачи и место ее хранения
            //let Task
            //ler taskReferense
        }
        let cancel = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        //добавление кнопок в алертКонтроллер
        alertContr.addAction(save)
        alertContr.addAction(cancel)
        //отображение
        present(alertContr, animated: true, completion: nil)
        
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
