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
        container.backgroundColor = .white
        container.clipsToBounds = true
        return container
    }()
    
    lazy var imageProfile: UIImageView = {
       var imageProfile = UIImageView()
        imageProfile.contentMode = .scaleAspectFill
        imageProfile.clipsToBounds = true
        return imageProfile
    }()
    
    lazy var fullnameLabel: UILabel = {
       var fullnameLabel = UILabel()
        fullnameLabel.font = .systemFont(ofSize: 16, weight: .regular)
        fullnameLabel.textColor = .black
        return fullnameLabel
    }()
    
    private lazy var mobileSection: UILabel = {
       var fullnameLabel = UILabel()
        fullnameLabel.font = .systemFont(ofSize: 8)
        fullnameLabel.textColor = .black
        return fullnameLabel
    }()
    
    lazy var mobilePhone: UILabel = {
       var fullnameLabel = UILabel()
        fullnameLabel.font = .systemFont(ofSize: 16)
        fullnameLabel.textColor = .systemBlue
        return fullnameLabel
    }()
    
    private lazy var emailSection: UILabel = {
       var fullnameLabel = UILabel()
        fullnameLabel.font = .systemFont(ofSize: 8)
        fullnameLabel.textColor = .black
        return fullnameLabel
    }()
    
    lazy var emailLabel: UILabel = {
       var fullnameLabel = UILabel()
        fullnameLabel.font = .systemFont(ofSize: 16)
        fullnameLabel.textColor = .systemBlue
        return fullnameLabel
    }()
    
    private lazy var addressSection: UILabel = {
       var fullnameLabel = UILabel()
        fullnameLabel.font = .systemFont(ofSize: 8)
        fullnameLabel.textColor = .black
        return fullnameLabel
    }()
    
    private lazy var addressLabel: UILabel = {
       var fullnameLabel = UILabel()
        fullnameLabel.font = .systemFont(ofSize: 16)
        fullnameLabel.textColor = .systemBlue
        return fullnameLabel
    }()
    
    private lazy var mobileStackView: UIStackView = {
       var mobileSV = UIStackView(arrangedSubviews: [mobileSection, mobilePhone])
        mobileSV.axis = .vertical
        mobileSV.spacing = 4
        return mobileSV
    }()
    
    private lazy var emailStackView: UIStackView = {
       var emailSV = UIStackView(arrangedSubviews: [emailSection, emailLabel])
        emailSV.axis = .vertical
        emailSV.spacing = 4
        return emailSV
    }()
    
    private lazy var addressStackView: UIStackView = {
       var addressSV = UIStackView(arrangedSubviews: [addressSection, addressLabel])
        addressSV.axis = .vertical
        addressSV.spacing = 4
        return addressSV
    }()
    
    private lazy var detailStackView: UIStackView = {
       var mobileSV = UIStackView(arrangedSubviews: [mobileStackView, emailStackView, addressStackView])
        mobileSV.axis = .vertical
        mobileSV.spacing = 16
        return mobileSV
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        view.addSubview(detailStackView)
        setupConstraint()
    }
    
    private func setupView() {
        view.backgroundColor = .secondarySystemBackground
    }
    
    private func setupConstraint() {
        detailStackView.translatesAutoresizingMaskIntoConstraints = false
        detailStackView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        detailStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
//        detailStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        detailStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }

}
