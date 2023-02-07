//
//  ViewController.swift
//  TodoApp
//
//  Created by Pierre Juarez U. on 7/02/23.
//

import UIKit

class ViewController: UIViewController {

    var items = [String]()
    @IBOutlet weak var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self
    }

    @IBAction func addBtnPressed(_ sender: Any) {
        
        var textfield = UITextField()
        let alert = UIAlertController(title: "Add new item", message: "", preferredStyle: .alert)
        let cancel = UIAlertAction(title: "Cancel", style: .default){ (cancel) in
            
        }
        let save = UIAlertAction(title: "Save", style: .default){ (save) in
            self.items.append(textfield.text!)
            self.table.reloadData()
        }
        
        alert.addTextField{ (text) in
            textfield = text
            textfield.placeholder  = "Add new item"
            
        }
        alert.addAction(cancel)
        alert.addAction(save)
        
        self.present(alert, animated: true, completion: nil)
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = items[indexPath.row]
        return cell
        
    }
    
    
}

