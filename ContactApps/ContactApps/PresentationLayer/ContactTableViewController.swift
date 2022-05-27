//
//  ContactTableViewController.swift
//  ContactApps
//
//  Created by nurin berlianna on 26/05/22.
//

import UIKit
import CoreData

class ContactTableViewController: UITableViewController, UISearchBarDelegate {
    var context: NSManagedObjectContext?
    var users: [UserModel] = []
    
    lazy var searchBar: UISearchBar = {
        var searchBar = UISearchBar()
        searchBar.searchBarStyle = UISearchBar.Style.default
        searchBar.placeholder = " Search..."
        searchBar.sizeToFit()
        searchBar.isTranslucent = false
        searchBar.backgroundImage = UIImage()
        searchBar.delegate = self
        return searchBar
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "UserEntity")
        
        do {
            let result = try managedContext.fetch(fetchRequest) as! [NSManagedObject]
            print(result.count)
            guard result.count != 0 else {return}
            result.forEach { user in
                users = []
                users.append(
                    UserModel(
                        firstName: user.value(forKey: "first_name") as! String,
                        lastName: user.value(forKey: "last_name") as! String,
                        aliasName: user.value(forKey: "alias_name") as! String,
                        dateOfBirth: user.value(forKey: "date_of_birth") as! String,
                        mobilePhone: user.value(forKey: "mobile_phone") as! String,
                        email: user.value(forKey: "email") as! String,
                        address: user.value(forKey: "address") as! String,
                        notes: user.value(forKey: "notes") as! String,
                        photo: user.value(forKey: "photo") as? Data ?? Data()
                    )
                )
            }
            print(users)
        } catch let err{
            print(err)
        }
        
        tableView.reloadData()
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "contactListCell")
        tableView.delegate = self
        tableView.dataSource = self
        setupNavigationItem()
        tableView.tableHeaderView = searchBar
//        view.addSubview(searchBar)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange textSearched: String)
    {
        print(textSearched)
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
//        let row: Int = indexPath.row
        let firstname = users[indexPath.row].firstName
        print(firstname)
        cell.textLabel?.text = firstname
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let indexSelect = tableView.indexPathForSelectedRow
        let cellCurrent = tableView.cellForRow(at: indexSelect ?? indexPath)
        let detailViewController = DetailViewController()
        let users = users[indexPath.row]
        detailViewController.fullnameLabel.text = cellCurrent?.textLabel?.text
        detailViewController.mobilePhone.text = "0812 0000 0000"
        detailViewController.emailLabel.text = "binar@academy.com"
        detailViewController.addressLabel.text = "Jakarta, Indonesia"
        
        navigationController?.pushViewController(detailViewController, animated: true)
    }

}


