//
//  UIImageView+loadImage.swift
//  iOSPlantManager
//
//  Created by joaovitor on 17/02/22.
//

import UIKit
import Nuke

extension UIImageView {
    func loadImage(from url: String) {
        guard let url = URL(string: url) else { return }
        
        Nuke.loadImage(with: url,
                       options: ImageLoadingOptions(placeholder: UIImage(systemName: "photo")),
                       into: self)
    }
}
