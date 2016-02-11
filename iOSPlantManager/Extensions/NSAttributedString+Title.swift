//
//  NSAttributedString+Weight.swift
//  iOSPlantManager
//
//  Created by joaovitor on 17/02/22.
//

import UIKit

extension NSAttributedString {
    static func weight(_ text: String) -> NSAttributedString {
        let attrs = [NSAttributedString.Key.font: UIFont.titleLarge!]
        
        return NSAttributedString(string: text, attributes: attrs)
    }
    
    func appendSufix(_ text: String) -> NSAttributedString {
        let mutable: NSMutableAttributedString = .init(attributedString: self)
        let attrs = [NSAttributedString.Key.font: UIFont.titleLarge!]
        
        let attrString = NSMutableAttributedString(string: "\n\(text)", attributes: attrs)
        
        mutable.append(attrString)
        
        return mutable
    }
}
