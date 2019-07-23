//
//  ViewController.swift
//  TodoDMD
//
//  Created by Dennis Dwarte on 10/7/19.
//  Copyright © 2019 Dennis Dwarte. All rights reserved.
//

import UIKit
import RealmSwift


class TodoListViewController: UITableViewController {
    
    var todoItems: Results<Item>?
    
    let realm = try! Realm()
    
    
    var selectedCategory : Category? {
        didSet{
           loadItems()
        }
    }
    
    // let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Items.plist")
    
    
    
    // let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

       
        /*
        let newItem = Item()
        newItem.title = "First Item"
        itemArray.append(newItem)
        
        let newItem2 = Item()
        newItem2.title = "Second Item"
        itemArray.append(newItem2)
        
        let newItem3 = Item()
        newItem3.title = "Third Item"
        itemArray.append(newItem3)
        */
        
        // loadItems()
        
        
       // if let items = defaults.array(forKey: "TodoListArray") as? [Item] {
       //    itemArray = items
       // }
        
        
    }

    //MARK - Tableview Datasource Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoItems?.count ?? 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        
        if let item = todoItems?[indexPath.row] {
            
        
        cell.textLabel?.text = item.title
        
        cell.accessoryType = item.done ? .checkmark : .none
        
        } else {
            cell.textLabel?.text = "No items Added"
        }
        return cell
    }
    
    
    
    // MARK - TableView Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // print(itemArray[indexPath.row])
        //
        // itemArray[indexPath.row].setValue("Completed", forKey: "title")
        
        //context.delete(itemArray[indexPath.row])
        //itemArray.remove(at: indexPath.row)
        
        /*
        todoItems?[indexPath.row].done = !todoItems[indexPath.row].done
        
        saveItems()
        */
        
        
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    // MARK - Add new Items
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add new Item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            // what will happen when User presses button on UIAlert
            
            if let currentCategory = self.selectedCategory {
                do {
                    try self.realm.write {
                    let newItem = Item()
                    newItem.title = textField.text!
                    currentCategory.items.append(newItem)
                    }
                } catch {
                    print("Error saving new items, \(error)")
                }
            }
            self.tableView.reloadData()
            
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create New Item"
            textField = alertTextField
            
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    
    //MARK - Model Manipulation Methods
    /*
    func saveItems() {
        
        
        do {
            try context.save()
            
        } catch {
            print("Error saving context, \(error)")
        }
        
        
        self.tableView.reloadData()
        
    }
 */
    func loadItems() {
       
        todoItems = selectedCategory?.items.sorted(byKeyPath: "title", ascending: true)
        //itemArray = selectedCategory?.items.sorted(byKeyPath: "title", ascending: true)
        tableView.reloadData()
    }
 
    
    
}

//MARK: - Search bar method
/*
extension TodoListViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let request : NSFetchRequest<Item> = Item.fetchRequest()
        
        request.predicate = NSPredicate(format: "title CONTAINS[cd] %@", searchBar.text!)
        
        
        request.sortDescriptors = [NSSortDescriptor(key: "title", ascending: true)]
        
        loadItems(with: request)
        
        
        
        
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text?.count == 0 {
            loadItems()
            
            DispatchQueue.main.async {
                searchBar.resignFirstResponder()
            }
           
            
        }
    }
}
 */
