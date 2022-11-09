//
//  NewBookViewController.swift
//  ReadMe
//
//  Created by Nazar Ivzhenko on 08.07.2022.
//

import UIKit

class NewBookViewController: UITableViewController {
    @IBOutlet var titleTextField: UITextField!
    @IBOutlet var authorTextField: UITextField!
    @IBOutlet var bookImageView: UIImageView!
    
    var newBookImage: UIImage?
    
    @IBAction func cancel() {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func saveNewBook() {
        guard let title = titleTextField.text, let author = authorTextField.text, !title.isEmpty, !title.isEmpty else { return }
        Library.addNew(book: Book(title: title, author: author, readMe: true, image: newBookImage))
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func addImage() {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType =
        UIImagePickerController.isSourceTypeAvailable(.camera)
        ? .camera
        : .photoLibrary
        imagePicker.allowsEditing = true
        present(imagePicker, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleTextField.delegate = self
        authorTextField.delegate = self
        
        titleTextField.returnKeyType = .next
        authorTextField.returnKeyType = .done
        
        bookImageView.layer.cornerRadius = 16
    }
}

extension NewBookViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let selectedImage = info[.editedImage] as? UIImage else { return }
        bookImageView.image = selectedImage
        newBookImage = selectedImage
        dismiss(animated: true)
    }
}

extension NewBookViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == titleTextField {
            return authorTextField.becomeFirstResponder()
        } else {
            return textField.resignFirstResponder()
        }
    }
}
