//
//  Recognized.swift
//  TextRecognition
//
//  Created by Tomasz Idzi on 03/04/2020.
//  Copyright © 2020 codemeapp. All rights reserved.
//

import Foundation

class Recognized: NSObject, NSCoding {
    var text: String
    var imagePath: URL

    init(text: String, imagePath: URL) {
        self.text = text
        self.imagePath = imagePath
    }

    required convenience init(coder aDecoder: NSCoder) {
        let text = aDecoder.decodeObject(forKey: "text") as! String
        let imagePath = aDecoder.decodeObject(forKey: "imagePath") as! URL
        self.init(text: text, imagePath: imagePath)
    }

    func encode(with aCoder: NSCoder) {
        aCoder.encode(text, forKey: "text")
        aCoder.encode(imagePath, forKey: "imagePath")
    }
}
