//
//  ViewController.swift
//  TextRecognition
//
//  Created by Tomasz Idzi on 03/04/2020.
//  Copyright © 2020 codemeapp. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var previewImageView: UIImageView!
    
    // MARK: - ViewController life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

// MARK: - Actions

extension ViewController {
    
    @IBAction func cameraDidTap(_ sender: Any) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = UIImagePickerController.isSourceTypeAvailable(.camera) ? .camera : .photoLibrary
        self.present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func recognizeDidTap(_ sender: Any) {
    }
}

// MARK: - UIImagePickerControllerDelegate

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        
        guard let image = info[UIImagePickerController.InfoKey(rawValue: UIImagePickerController.InfoKey.originalImage.rawValue)] as? UIImage else { return }
        previewImageView.image = image
    }
}
