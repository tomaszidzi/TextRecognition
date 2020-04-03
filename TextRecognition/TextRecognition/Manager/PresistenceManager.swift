//
//  PresistenceManager.swift
//  TextRecognition
//
//  Created by Tomasz Idzi on 03/04/2020.
//  Copyright © 2020 codemeapp. All rights reserved.
//

import Foundation

class PresistenceManager {
    
    private static let RecognizedKey = "RecognizedObjects"
    
    static func save(object: Recognized) {
        var currentObjects = PresistenceManager.getObjects()
        currentObjects.append(object)
        if let archived = try? NSKeyedArchiver.archivedData(withRootObject: currentObjects as NSArray, requiringSecureCoding: false) as Data {
            UserDefaults.standard.set(archived, forKey: RecognizedKey)
            UserDefaults.standard.synchronize()
        }
    }
    
    static func getObjects() -> [Recognized] {
       if let unarchived = UserDefaults.standard.object(forKey: RecognizedKey) as? Data,
        let savedObjects = try? NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(unarchived) as? [Recognized] {
            return savedObjects
        } else {
            return [Recognized]()
        }
    }
}
