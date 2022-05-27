//
//  DetailViewController.swift
//  ContactApps
//
//  Created by Adji Firmansyah on 5/27/22.
//

import UIKit

class DetailViewController: UIViewController {
    lazy var profileContainer: UIView = {
        var container = UIView()
        container.backgroundColor = .darkGray
        container.clipsToBounds = true
        container.layer.cornerRadius = 50
        return container
    }()
    
    lazy var imageProfile: UIImageView = {
       var imageProfile = UIImageView()
        imageProfile.contentMode = .scaleAspectFill
        imageProfile.clipsToBounds = true
        return imageProfile
    }()
    
    lazy var fullnameLabel: UILabel = {
       var lbl = UILabel()
        lbl.textAlignment = .center
        lbl.font = .systemFont(ofSize: 18, weight: .regular)
        lbl.textColor = .black
        return lbl
    }()
    
    private lazy var mobileSection: UILabel = {
       var lbl = UILabel()
        lbl.font = .systemFont(ofSize: 12)
        lbl.textColor = .black
        return lbl
    }()
    
    lazy var mobilePhone: UILabel = {
       var lbl = UILabel()
        lbl.font = .systemFont(ofSize: 18)
        lbl.textColor = .systemBlue
        return lbl
    }()
    
    private lazy var emailSection: UILabel = {
       var lbl = UILabel()
        lbl.font = .systemFont(ofSize: 12)
        lbl.textColor = .black
        return lbl
    }()
    
    lazy var emailLabel: UILabel = {
       var lbl = UILabel()
        lbl.font = .systemFont(ofSize: 18)
        lbl.textColor = .systemBlue
        return lbl
    }()
    
    private lazy var addressSection: UILabel = {
       var lbl = UILabel()
        lbl.font = .systemFont(ofSize: 12)
        lbl.textColor = .black
        return lbl
    }()
    
    lazy var addressLabel: UILabel = {
       var lbl = UILabel()
        lbl.font = .systemFont(ofSize: 18)
        lbl.textColor = .systemBlue
        return lbl
    }()
    
    private lazy var notesSection: UILabel = {
       var lbl = UILabel()
        lbl.font = .systemFont(ofSize: 12)
        lbl.textColor = .black
        return lbl
    }()
    
    lazy var notesLabel: UILabel = {
       var lbl = UILabel()
        lbl.font = .systemFont(ofSize: 18)
        lbl.textColor = .systemBlue
        return lbl
    }()
    
    private lazy var mobileStackView: UIStackView = {
       var mobileSV = UIStackView(arrangedSubviews: [mobileSection, mobilePhone])
        mobileSV.axis = .vertical
        mobileSV.spacing = 4
        mobileSV.backgroundColor = .white
        return mobileSV
    }()
    
    private lazy var emailStackView: UIStackView = {
       var emailSV = UIStackView(arrangedSubviews: [emailSection, emailLabel])
        emailSV.axis = .vertical
        emailSV.spacing = 4
        emailSV.backgroundColor = .white
        return emailSV
    }()
    
    private lazy var addressStackView: UIStackView = {
       var addressSV = UIStackView(arrangedSubviews: [addressSection, addressLabel])
        addressSV.axis = .vertical
        addressSV.spacing = 4
        addressSV.backgroundColor = .white
        return addressSV
    }()
    
    private lazy var notesStackView: UIStackView = {
       var notesSV = UIStackView(arrangedSubviews: [notesSection, notesLabel])
        notesSV.axis = .vertical
        notesSV.spacing = 4
        notesSV.backgroundColor = .white
        return notesSV
    }()
    
    private lazy var scrollView: UIScrollView = {
        var scrollView = UIScrollView()
        return scrollView
    }()
    
    private lazy var containerView: UIView = {
        var container = UIView()
        return container
    }()
    
    var heightConstraint: NSLayoutConstraint?
    
//    private lazy var detailStackView: UIStackView = {
//       var mobileSV = UIStackView(arrangedSubviews: [mobileStackView, emailStackView, addressStackView])
//        mobileSV.axis = .vertical
//        mobileSV.spacing = 24
//        return mobileSV
//    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubview()
        configView()
        setupConstraint()
    }
    
    private func configView() {
        view.backgroundColor = .secondarySystemBackground
        mobileSection.text = "Mobile phone"
        emailSection.text = "Email"
        addressSection.text = "Address"
        notesSection.text = "Notes"
        
        let rightBarButtonItem = UIBarButtonItem(
            title: "Edit",
            style: .plain,
            target: self,
            action: #selector(editContact)
        )
        navigationItem.rightBarButtonItem = rightBarButtonItem
    }
    
    private func profileImage() {
        if imageProfile.image == nil {
            
        }
    }
    func imageWith(name: String?) -> UIImage? {
         let frame = CGRect(x: 0, y: 0, width: 100, height: 100)
         let nameLabel = UILabel(frame: frame)
         nameLabel.textAlignment = .center
         nameLabel.backgroundColor = .lightGray
         nameLabel.textColor = .white
         nameLabel.font = UIFont.boldSystemFont(ofSize: 40)
         nameLabel.text = name
         UIGraphicsBeginImageContext(frame.size)
          if let currentContext = UIGraphicsGetCurrentContext() {
             nameLabel.layer.render(in: currentContext)
             let nameImage = UIGraphicsGetImageFromCurrentImageContext()
             return nameImage
          }
          return UIImage()
    }
    
    func fill(_ users: UserModel){
        let firstChar = String(users.firstName.prefix(1))
        let photo = UIImage(data: users.photo)?.resized(to: CGSize(width: 170, height: 170))
        profileContainer.backgroundColor = UIColor(patternImage:(  photo ?? imageWith(name: firstChar))! )
        let aliasName = users.aliasName != "" ? "(\(users.aliasName))" : ""
        fullnameLabel.text = [users.firstName, users.lastName, aliasName].joined(separator: " ")
        mobilePhone.text = users.mobilePhone
        emailLabel.text = users.email
        addressLabel.text = users.address
        notesLabel.text = users.notes
        

    }
    
    
    private func addSubview() {
        view.addSubview(scrollView)
        scrollView.addSubview(containerView)
        containerView.addSubview(profileContainer)
        containerView.addSubview(fullnameLabel)
        containerView.addSubview(mobileStackView)
        containerView.addSubview(emailStackView)
        containerView.addSubview(addressStackView)
        containerView.addSubview(notesStackView)
    }
    
    @objc private func editContact() {
        let vc = EditViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    private func setupConstraint() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        containerView.translatesAutoresizingMaskIntoConstraints = false
        profileContainer.translatesAutoresizingMaskIntoConstraints = false
        fullnameLabel.translatesAutoresizingMaskIntoConstraints = false
        mobileStackView.translatesAutoresizingMaskIntoConstraints = false
        emailStackView.translatesAutoresizingMaskIntoConstraints = false
        addressStackView.translatesAutoresizingMaskIntoConstraints = false
        notesStackView.translatesAutoresizingMaskIntoConstraints = false
        
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        containerView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive      = true
        containerView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive  = true
        containerView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive   = true
        containerView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        containerView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive   = true
        
        heightConstraint = containerView.heightAnchor.constraint(equalTo: scrollView.heightAnchor)
        heightConstraint?.priority  = .defaultLow
        heightConstraint?.isActive  = true
        
        profileContainer.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 24).isActive = true
        profileContainer.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
        profileContainer.heightAnchor.constraint(equalToConstant: 100).isActive = true
        profileContainer.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        fullnameLabel.topAnchor.constraint(equalTo: profileContainer.bottomAnchor, constant: 16).isActive = true
        fullnameLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16).isActive = true
        fullnameLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16).isActive = true
        
        mobileStackView.topAnchor.constraint(equalTo: fullnameLabel.bottomAnchor, constant: 32).isActive = true
        mobileStackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16).isActive = true
        mobileStackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16).isActive = true
        
        emailStackView.topAnchor.constraint(equalTo: mobileStackView.bottomAnchor, constant: 32).isActive = true
        emailStackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16).isActive = true
        emailStackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16).isActive = true
        
        addressStackView.topAnchor.constraint(equalTo: emailStackView.bottomAnchor, constant: 32).isActive = true
        addressStackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16).isActive = true
        addressStackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16).isActive = true
        
        notesStackView.topAnchor.constraint(equalTo: addressStackView.bottomAnchor, constant: 32).isActive = true
        notesStackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16).isActive = true
        notesStackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16).isActive = true
        notesStackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -24).isActive = true
    }

}
