//
//  AddNoteViewController.swift
//  Test MVP2
//
//  Created by Nikita Shirobokov on 18.04.24.
//

import UIKit

class AddNoteViewController: UIViewController {
    var saveNoteClosure: ((Note) -> Void)?
    
    let titleTextField = UITextField()
    let contentTextView = UITextView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        view.backgroundColor = .white
        
        titleTextField.placeholder = "Title"
        titleTextField.borderStyle = .roundedRect
        view.addSubview(titleTextField)
        
        contentTextView.layer.borderColor = UIColor.gray.cgColor
        contentTextView.layer.borderWidth = 1
        view.addSubview(contentTextView)
        
        titleTextField.translatesAutoresizingMaskIntoConstraints = false
        contentTextView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            titleTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            titleTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            contentTextView.topAnchor.constraint(equalTo: titleTextField.bottomAnchor, constant: 20),
            contentTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            contentTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            contentTextView.heightAnchor.constraint(equalToConstant: 200)
        ])
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveNote))
    }
    
    @objc func saveNote() {
        let note = Note(title: titleTextField.text ?? "", content: contentTextView.text)
        saveNoteClosure?(note)
        navigationController?.popViewController(animated: true)
    }
}
