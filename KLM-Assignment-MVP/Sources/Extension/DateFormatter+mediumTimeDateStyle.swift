//
//  DateFormatter+mediumTimeDateStyle.swift
//  KLM Assignment
//
//  Created by Евгений Урбановский on 5/5/23.
//

import Foundation

extension DateFormatter {
    static var mediumTimeDateStyle: DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .medium
        return dateFormatter
    }
}
