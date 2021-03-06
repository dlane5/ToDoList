//
//  ToDoTableViewController.swift
//  ToDoList
//
//  Created by Westside Health Authority on 1/2/21.
//

import Foundation

import UIKit

class ToDoTableViewController: UITableViewController {
    var todos = [ToDo]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        if let savedToDos = ToDo.loadToDos() {
            todos = savedToDos
        } else {
            todos = ToDo.loadSampleToDos()
        }

        navigationItem.leftBarButtonItem = editButtonItem

    }
    @IBAction func unwindToToDoList(segue: UIStoryboardSegue) {
        
    }
     

override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return todos.count
    }
override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier:
  "ToDoCellIdentifier", for: indexPath)

   let todo = todos[indexPath.row]
    cell.textLabel?.text = todo.title
   return cell
}

    override func tableView(_ tableView: UITableView, canEditRowAt
    indexPath: IndexPath) -> Bool {
        return true
    }
    
    
    override func tableView(_ tableView: UITableView, commit
    editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath:
    IndexPath) {
        if editingStyle == .delete {
            todos.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }

}
