//
//  DetailViewController.swift
//  ContactApps
//
//  Created by Adji Firmansyah on 5/27/22.
//

import UIKit

class DetailViewController: UIViewController {
    private lazy var profileContainer: UIView = {
        var container = UIView()
        container.backgroundColor = .systemBlue
        container.clipsToBounds = true
        container.layer.cornerRadius = 50
        return container
    }()
    
//    lazy var imageProfile: UIImageView = {
//       var imageProfile = UIImageView()
//        imageProfile.contentMode = .scaleAspectFill
//        imageProfile.clipsToBounds = true
//        return imageProfile
//    }()
    
    lazy var fullnameLabel: UILabel = {
       var fullnameLabel = UILabel()
        fullnameLabel.textAlignment = .center
        fullnameLabel.font = .systemFont(ofSize: 18, weight: .regular)
        fullnameLabel.textColor = .black
        return fullnameLabel
    }()
    
    private lazy var mobileSection: UILabel = {
       var fullnameLabel = UILabel()
        fullnameLabel.font = .systemFont(ofSize: 12)
        fullnameLabel.textColor = .black
        return fullnameLabel
    }()
    
    lazy var mobilePhone: UILabel = {
       var fullnameLabel = UILabel()
        fullnameLabel.font = .systemFont(ofSize: 18)
        fullnameLabel.textColor = .systemBlue
        return fullnameLabel
    }()
    
    private lazy var emailSection: UILabel = {
       var fullnameLabel = UILabel()
        fullnameLabel.font = .systemFont(ofSize: 12)
        fullnameLabel.textColor = .black
        return fullnameLabel
    }()
    
    lazy var emailLabel: UILabel = {
       var fullnameLabel = UILabel()
        fullnameLabel.font = .systemFont(ofSize: 18)
        fullnameLabel.textColor = .systemBlue
        return fullnameLabel
    }()
    
    private lazy var addressSection: UILabel = {
       var fullnameLabel = UILabel()
        fullnameLabel.font = .systemFont(ofSize: 12)
        fullnameLabel.textColor = .black
        return fullnameLabel
    }()
    
    lazy var addressLabel: UILabel = {
       var fullnameLabel = UILabel()
        fullnameLabel.font = .systemFont(ofSize: 18)
        fullnameLabel.textColor = .systemBlue
        return fullnameLabel
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
    
    private lazy var scrollView: UIScrollView = {
        var scrollView = UIScrollView()
        return scrollView
    }()
    
    private lazy var containerView: UIView = {
        var container = UIView()
        return container
    }()
    
    var heightConstraint: NSLayoutConstraint?
    
    private func configView() {
        view.backgroundColor = .secondarySystemBackground
        mobileSection.text = "Mobile phone"
        emailSection.text = "Email"
        addressSection.text = "Address"
    }
    
    private func addSubview() {
        view.addSubview(scrollView)
        scrollView.addSubview(containerView)
        containerView.addSubview(profileContainer)
        containerView.addSubview(fullnameLabel)
        containerView.addSubview(mobileStackView)
        containerView.addSubview(emailStackView)
        containerView.addSubview(addressStackView)
        
    }
    
    private func setupConstraint() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        containerView.translatesAutoresizingMaskIntoConstraints = false
        profileContainer.translatesAutoresizingMaskIntoConstraints = false
        fullnameLabel.translatesAutoresizingMaskIntoConstraints = false
        mobileStackView.translatesAutoresizingMaskIntoConstraints = false
        emailStackView.translatesAutoresizingMaskIntoConstraints = false
        addressStackView.translatesAutoresizingMaskIntoConstraints = false
//        detailStackView.translatesAutoresizingMaskIntoConstraints = false
        
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
        profileContainer.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 24).isActive = true
        profileContainer.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -24).isActive = true
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
        addressStackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -24).isActive = true
    }

}
