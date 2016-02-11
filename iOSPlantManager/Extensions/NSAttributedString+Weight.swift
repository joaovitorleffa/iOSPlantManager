//
//  NSAttributedString+Weight.swift
//  iOSPlantManager
//
//  Created by joaovitor on 11/02/16.
//

import UIKit

extension NSAttributedString {
    static func weight(_ text: String) -> NSAttributedString {
        let attrs = [NSAttributedString.Key.font: UIFont.headingLargeSemiBold!]
        
        return NSAttributedString(string: text, attributes: attrs)
    }
    
    static func formatDeleteMessage(message: String, plantName: String) -> NSAttributedString {
        let mutable: NSMutableAttributedString = .init(string: message)
        let modified = NSAttributedString.weight(plantName)
        
        mutable.append(modified)
        mutable.append(NSAttributedString(string: "?"))
        
        return mutable
    }
}
