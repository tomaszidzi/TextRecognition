//
//  UIImageExtensions.swift
//  TextRecognition
//
//  Created by Tomasz Idzi on 03/04/2020.
//  Copyright © 2020 codemeapp. All rights reserved.
//

import UIKit

extension UIImage {
    func setupUpOrientation() -> UIImage? {
        switch imageOrientation {
        case .up:
            return self
        default:
            UIGraphicsBeginImageContextWithOptions(size, false, scale)
            draw(in: CGRect(origin: .zero, size: size))
            let result = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            return result
        }
    }
    
    func saveImage() -> URL? {
        guard let data = self.pngData()  else { return nil }
            
        let documents = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let uniqueIdentifier = UUID().uuidString
        let url = documents.appendingPathComponent("\(uniqueIdentifier).png")

        do {
            try data.write(to: url)
            return url

        } catch {
            print("Unable to write data (\(error))")
        }
        
        return nil
    }
}
