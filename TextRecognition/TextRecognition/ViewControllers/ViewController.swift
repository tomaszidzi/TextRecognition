//
//  ViewController.swift
//  TextRecognition
//
//  Created by Tomasz Idzi on 03/04/2020.
//  Copyright © 2020 codemeapp. All rights reserved.
//

import TesseractOCR
import UIKit

class ViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var previewImageView: UIImageView!
    @IBOutlet weak var resultTextView: UITextView!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var rectognizeButton: UIButton!
    
    // MARK: - ViewController life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func recognizeText(with image: UIImage) {
        guard let tesseract = G8Tesseract(language: "eng") else { return }
        tesseract.image = image
        tesseract.recognize()
        
        if let textResult = tesseract.recognizedText {
            resultTextView.text = textResult
        }
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
        if let image = self.previewImageView.image {
            recognizeText(with: image)
        }
    }
    
    @IBAction func saveDidTap(_ sender: Any) {
        guard let image = previewImageView.image,
            let imageUrl = image.saveImage(),
            let text = resultTextView.text, !text.isEmpty else { return }
        
        let object = Recognized(text: text, imagePath: imageUrl)
        PresistenceManager.save(object: object)
    }
    
    @IBAction func historyDidTap(_ sender: Any) {
        performSegue(withIdentifier: "ShowHistory", sender: self)
    }
}

// MARK: - UIImagePickerControllerDelegate
extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        
        guard let image = info[UIImagePickerController.InfoKey(rawValue: UIImagePickerController.InfoKey.originalImage.rawValue)] as? UIImage else { return }
        resultTextView.text = nil
        previewImageView.image = image.setupUpOrientation()
        rectognizeButton.isEnabled = true
    }
}


// MARK: - UITextViewDelegate
extension ViewController: UITextViewDelegate {
    func textViewDidChangeSelection(_ textView: UITextView) {
        saveButton.isEnabled = !textView.text.isEmpty
    }
}


