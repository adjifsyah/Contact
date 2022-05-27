//
//  CreateViewController.swift
//  ContactApps
//
//  Created by Adji Firmansyah on 5/26/22.
//

import UIKit
import CoreData

class CreateViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    var photo: UIImage = UIImage()
    var reloadData: (() -> Void)?
    
    lazy var addPhotoButton: UIButton = {
        let button = UIButton()
        let Config = UIImage.SymbolConfiguration(pointSize: 130, weight: .bold, scale: .large)
        let photoSymbol = UIImage(systemName: "person.crop.circle.fill", withConfiguration: Config)
        button.setImage(photoSymbol, for: .normal)
        button.tintColor = .gray
        button.addTarget(self, action: #selector(addPhotoAction), for: .touchUpInside)
        return button
    }()
    
    lazy var addPhotoTextButton : UILabel = {
        let lbl = UILabel()
        lbl.text = "Add Photo"
        lbl.textColor = .systemBlue
        lbl.font = UIFont.systemFont(ofSize: 16)
        lbl.textAlignment = .center
//        lbl.addTarget(self, action: #selector(addPhotoAction), for: .touchUpInside)
        return lbl
    }()
    
    lazy var firstNameTextField: FormTextField = {
        var firstNameTF = FormTextField()
//        firstNameTF.formTextField.addTarget(self, action: #selector(firstNameChange(textField:)), for: .editingChanged)
        firstNameTF.configure(placeholder: "First name")
        firstNameTF.setHeight = 40
        firstNameTF.setMargin = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: -16)
        
        return firstNameTF
    }()
    
    lazy var lastNameTextField: FormTextField = {
        var firstNameTF = FormTextField()
//        firstNameTF.formTextField.addTarget(self, action: #selector(firstNameChange(textField:)), for: .editingChanged)
        firstNameTF.configure(placeholder: "Last name")
        firstNameTF.setHeight = 40
        firstNameTF.setMargin = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: -16)
        
        return firstNameTF
    }()
    
    lazy var aliasNameTextField: FormTextField = {
        var aliasNameTF = FormTextField()
//        aliasNameTF.formTextField.addTarget(self, action: #selector(firstNameChange(textField:)), for: .editingChanged)
        aliasNameTF.configure(placeholder: "Alias name")
        aliasNameTF.setHeight = 40
        aliasNameTF.setMargin = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: -16)
        
        return aliasNameTF
    }()
    
    lazy var dateOfBirthTextField: FormTextField = {
        var dateOfBirthTF = FormTextField()
//        dateOfBirthTF.formTextField.addTarget(self, action: #selector(firstNameChange(textField:)), for: .editingChanged)
        dateOfBirthTF.configure(placeholder: "Date of Birth")
        dateOfBirthTF.setHeight = 40
        dateOfBirthTF.setMargin = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: -16)
        
        var datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        if #available(iOS 13.4, *) {
            datePicker.preferredDatePickerStyle = .wheels
        }
        datePicker.addTarget(self, action: #selector(self.datePickerValueChanged(datePicker:)), for: .valueChanged)

        
        dateOfBirthTF.formTextField.inputView = datePicker

        
        return dateOfBirthTF
    }()
    
    
    lazy var mobilePhoneTextField: FormTextField = {
        var mobilePhoneTF = FormTextField()
//        mobilePhoneTF.formTextField.addTarget(self, action: #selector(firstNameChange(textField:)), for: .editingChanged)
        mobilePhoneTF.configure(placeholder: "Mobile phone")
        mobilePhoneTF.setHeight = 40
        mobilePhoneTF.setMargin = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: -16)
        
        return mobilePhoneTF
    }()
    
    lazy var emailTextField: FormTextField = {
        var emailTF = FormTextField()
//        emailTF.formTextField.addTarget(self, action: #selector(firstNameChange(textField:)), for: .editingChanged)
        emailTF.configure(placeholder: "Email")
        emailTF.setHeight = 40
        emailTF.setMargin = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: -16)
        
        return emailTF
    }()
    
    lazy var addressTextField: FormTextField = {
        var addressTF = FormTextField()
//        addressTF.formTextField.addTarget(self, action: #selector(firstNameChange(textField:)), for: .editingChanged)
        addressTF.configure(placeholder: "Address")
        addressTF.setHeight = 40
        addressTF.setMargin = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: -16)
        
        return addressTF
    }()

    lazy var notesTextField: FormTextField = {
        var notesTF = FormTextField()
//        notesTF.formTextField.addTarget(self, action: #selector(firstNameChange(textField:)), for: .editingChanged)
        notesTF.configure(placeholder: "First name")
//        notesTF.formTextField.addTarget(self, action: #selector(firstNameChange(textField:)), for: .editingChanged)
        notesTF.configure(placeholder: "Notes")
        notesTF.setHeight = 40
        notesTF.setMargin = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: -16)
        
        return notesTF
    }()
    
    
//    Date of Birth (Optional) (Format: Sat, 28 Jun 2022)
//    - Photo (Optional)
//        - If there is no photo, use the first character and last character as the image
//    - Mobile Phone (Required)
//    - Email (Required)
//    - Notes (Optional)
    
//    lazy var mobilePhoneTextField: FormTextField = {
//        var mobilePhoneTF = FormTextField()
//        mobilePhoneTF.formTextField.addTarget(self, action: #selector(firstNameChange(textField:)), for: .editingChanged)
//        mobilePhoneTF.configure(placeholder: "Mobile phone")
//        mobilePhoneTF.setHeight = 40
//        mobilePhoneTF.setMargin = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: -16)
//
//        return mobilePhoneTF
//    }()
//
//    lazy var emailTextField: FormTextField = {
//        var emailTF = FormTextField()
//        emailTF.formTextField.addTarget(self, action: #selector(firstNameChange(textField:)), for: .editingChanged)
//        emailTF.configure(placeholder: "Email")
//        emailTF.setHeight = 40
//        emailTF.setMargin = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: -16)
//
//        return emailTF
//    }()
//
//    lazy var addressTextField: FormTextField = {
//        var addressTF = FormTextField()
//        addressTF.formTextField.addTarget(self, action: #selector(firstNameChange(textField:)), for: .editingChanged)
//        addressTF.configure(placeholder: "Address")
//        addressTF.setHeight = 40
//        addressTF.setMargin = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: -16)
//
//        return addressTF
//    }()
//
//    lazy var notesTextField: FormTextField = {
//        var notesTF = FormTextField()
//        notesTF.formTextField.addTarget(self, action: #selector(firstNameChange(textField:)), for: .editingChanged)
//        notesTF.configure(placeholder: "First name")
//        notesTF.setHeight = 40
//        notesTF.setMargin = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: -16)
//
//        return notesTF
//    }()
    
    private lazy var addPhotoStackView: UIStackView = {
        var addPhotoStackView = UIStackView(arrangedSubviews: [
            addPhotoButton,
            addPhotoTextButton,
        ])
        addPhotoStackView.axis = .vertical
        return addPhotoStackView
    }()
    
    private lazy var namesStackView: UIStackView = {
        var nameStackView = UIStackView(arrangedSubviews: [
            firstNameTextField,
            lastNameTextField,
            aliasNameTextField,
            dateOfBirthTextField,
            mobilePhoneTextField,
            emailTextField,
            addressTextField,
            notesTextField
        ])
        nameStackView.axis = .vertical
        nameStackView.backgroundColor = .white
        return nameStackView
    }()
    
    lazy var scrollView: UIScrollView = {
        var scrollView = UIScrollView()
        return scrollView
    }()
    
    private lazy var containerView: UIView = {
        var container = UIView()
        return container
    }()
    
    var heightConstraint: NSLayoutConstraint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .secondarySystemBackground
        addSubview()
        configNavigationView()
        setupConstraint()
    }
    
    private func addSubview() {
        view.addSubview(scrollView)
        
        scrollView.addSubview(containerView)
        containerView.addSubview(addPhotoStackView)
        containerView.addSubview(namesStackView)
//        containerView.addSubview(mobilePhoneTextField)
//        containerView.addSubview(emailTextField)
//        containerView.addSubview(addressTextField)
    }
    
    private func configNavigationView() {
        title = "New Contact"
        
        let leftBarButtonItem = UIBarButtonItem(
            title: "Cancel",
            style: .plain,
            target: self,
            action: #selector(cancel)
        )
        
        let rightBarButtonItem = UIBarButtonItem(
            title: "Done",
            style: .done,
            target: self,
            action: #selector(saveContact)
        )
        
        navigationController?.navigationBar.barTintColor = .secondarySystemBackground
        navigationItem.leftBarButtonItem = leftBarButtonItem
        navigationItem.rightBarButtonItem = rightBarButtonItem
    }
    
    @objc private func cancel(textField: UITextField) {
        dismiss(animated: true, completion: nil)
    }
    
    @objc private func saveContact(textField: UITextField) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let userEntity = UserEntity(context: managedContext)
//        print(userEntity)
        userEntity.first_name = firstNameTextField.formTextField.text
        userEntity.last_name = lastNameTextField.formTextField.text
        userEntity.alias_name = aliasNameTextField.formTextField.text
        userEntity.date_of_birth = dateOfBirthTextField.formTextField.text
        userEntity.mobile_phone = mobilePhoneTextField.formTextField.text
        userEntity.email = emailTextField.formTextField.text
        userEntity.address = addressTextField.formTextField.text
        userEntity.notes = notesTextField.formTextField.text
        userEntity.photo = photo.jpegData(compressionQuality: 0.5)
       
        do {
            try managedContext.save()
            reloadData?()
            self.navigationController?.dismiss(animated: true, completion:nil);
            
        } catch {
            print("Error")
        }
    }
    
    @objc func datePickerValueChanged(datePicker: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "E, dd MMM yyyy"
        dateOfBirthTextField.formTextField.text = dateFormatter.string(from: datePicker.date)
    }
    
    @objc func addPhotoAction(_ sender: Any) {
        let imagePickerVC = UIImagePickerController()
        imagePickerVC.sourceType = .photoLibrary
        imagePickerVC.delegate = self // new
        present(imagePickerVC, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)

        if let image = info[.originalImage] as? UIImage {
            photo = image
            addPhotoButton.setImage(image.circularImage(size: CGSize(width: 170, height: 170)), for: .normal)
        }
    }
    
    private func setupConstraint() {
        scrollView.translatesAutoresizingMaskIntoConstraints            = false
        containerView.translatesAutoresizingMaskIntoConstraints         = false
        addPhotoStackView.translatesAutoresizingMaskIntoConstraints     = false
        namesStackView.translatesAutoresizingMaskIntoConstraints        = false
//        mobilePhoneTextField.translatesAutoresizingMaskIntoConstraints  = false
//        emailTextField.translatesAutoresizingMaskIntoConstraints        = false
//        addressTextField.translatesAutoresizingMaskIntoConstraints      = false
        
        
        scrollView.topAnchor.constraint(
            equalTo: view.topAnchor).isActive       = true
        scrollView.leadingAnchor.constraint(
            equalTo: view.leadingAnchor).isActive   = true
        scrollView.bottomAnchor.constraint(
            equalTo: view.bottomAnchor).isActive    = true
        scrollView.trailingAnchor.constraint(
            equalTo: view.trailingAnchor).isActive  = true
        
        
        containerView.topAnchor.constraint(
            equalTo: scrollView.topAnchor).isActive      = true
        containerView.leadingAnchor.constraint(
            equalTo: scrollView.leadingAnchor).isActive  = true
        containerView.bottomAnchor.constraint(
            equalTo: scrollView.bottomAnchor).isActive   = true
        containerView.trailingAnchor.constraint(
            equalTo: scrollView.trailingAnchor).isActive = true
        containerView.widthAnchor.constraint(
            equalTo: scrollView.widthAnchor).isActive   = true
        
        heightConstraint = containerView.heightAnchor.constraint(
            equalTo: scrollView.heightAnchor)
        heightConstraint?.priority  = .defaultLow
        heightConstraint?.isActive  = true
        
        addPhotoStackView.topAnchor.constraint(
            equalTo: containerView.topAnchor,
            constant: 24).isActive = true
        addPhotoStackView.leadingAnchor.constraint(
            equalTo: containerView.leadingAnchor).isActive = true
        addPhotoStackView.trailingAnchor.constraint(
            equalTo: containerView.trailingAnchor).isActive = true
        
        namesStackView.topAnchor.constraint(
                equalTo: addPhotoStackView.bottomAnchor,
                constant: 24).isActive = true
        namesStackView.leadingAnchor.constraint(
            equalTo: containerView.leadingAnchor).isActive = true
        namesStackView.trailingAnchor.constraint(
            equalTo: containerView.trailingAnchor).isActive = true
        
        
//        mobilePhoneTextField.topAnchor.constraint(
//            equalTo: namesStackView.bottomAnchor,
//            constant: 24).isActive = true
//        mobilePhoneTextField.leadingAnchor.constraint(
//            equalTo: containerView.leadingAnchor,
//            constant: 16).isActive = true
//        mobilePhoneTextField.trailingAnchor.constraint(
//            equalTo: containerView.trailingAnchor,
//            constant: -16).isActive = true
//
//        emailTextField.topAnchor.constraint(
//            equalTo: mobilePhoneTextField.bottomAnchor,
//            constant: 24).isActive = true
//        emailTextField.leadingAnchor.constraint(
//            equalTo: containerView.leadingAnchor,
//            constant: 16).isActive = true
//        emailTextField.trailingAnchor.constraint(
//            equalTo: containerView.trailingAnchor,
//            constant: -16).isActive = true
//
//        addressTextField.topAnchor.constraint(
//            equalTo: emailTextField.bottomAnchor,
//            constant: 24).isActive = true
//        addressTextField.leadingAnchor.constraint(
//            equalTo: containerView.leadingAnchor,
//            constant: 16).isActive = true
//        addressTextField.trailingAnchor.constraint(
//            equalTo: containerView.trailingAnchor,
//            constant: -16).isActive = true
//        addressTextField.bottomAnchor.constraint(
//            equalTo: containerView.bottomAnchor,
//            constant: -24).isActive = true
        
    }
    
}
