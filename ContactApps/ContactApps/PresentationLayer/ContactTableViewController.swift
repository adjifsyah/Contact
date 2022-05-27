//
//  ContactTableViewController.swift
//  ContactApps
//
//  Created by nurin berlianna on 26/05/22.
//

import UIKit
import CoreData

class ContactTableViewController: UITableViewController {
    var users: [NSManagedObject] = []
    
    override func viewWillAppear(_ animated: Bool) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "UserModel")
        
        do {
            users = try managedContext.fetch(fetchRequest)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationItem()
    }

    func setupNavigationItem() {
        title = "Contact"
        buttonAddView()
    }
    
    func buttonAddView() {
        let imageAdd = UIImage(systemName: "plus")
        let rightBarButton = UIBarButtonItem(image: imageAdd, style: .plain, target: self, action: #selector(addAction))
        navigationItem.rightBarButtonItem = rightBarButton
    }
    
    @objc func addAction() {
        let vc = CreateViewController()
        let navigationVC = UINavigationController(rootViewController: vc)
        navigationController?.present(navigationVC, animated: true, completion: nil)
    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return users.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "contactListCell", for: indexPath)
        let row: Int = indexPath.row
        cell.textLabel?.text = users[row].
        return cell
    }

}


