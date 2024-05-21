//
//  Date+Extension.swift
//  Pollexa
//
//  Created by Furkan Yıldırım on 20.05.2024.
//

import Foundation

extension Date {
    func timeAgoDisplay() -> String {
        let formatter = RelativeDateTimeFormatter()
        formatter.unitsStyle = .full
        return formatter.localizedString(for: self, relativeTo: Date())
    }
}
