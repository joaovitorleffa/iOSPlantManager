//
//  Date+Seconds.swift
//  iOSPlantManager
//
//  Created by joaovitor on 23/02/22.
//

import Foundation

extension Date {
    var seconds: Int {
        let calendar = Calendar.current
        
        let hours = calendar.component(.hour, from: self)
        let minutes = calendar.component(.minute, from: self)
        let seconds = calendar.component(.second, from: self)
        
        let s = (hours * 60 * 60) + minutes * 60 + seconds
        
        return s
    }
}
