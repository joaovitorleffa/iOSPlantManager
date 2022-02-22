//
//  Date+Format.swift
//  iOSPlantManager
//
//  Created by joaovitor on 11/02/16.
//

import Foundation

extension Date {
    var formatHHmm: String {
        let formatter = DateFormatter()
        
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        formatter.dateStyle = .short
        formatter.setLocalizedDateFormatFromTemplate("HH:mm")
        
        return formatter.string(from: self)
    }
}
