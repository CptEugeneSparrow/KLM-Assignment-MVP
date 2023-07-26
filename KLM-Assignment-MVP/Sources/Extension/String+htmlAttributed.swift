//
//  String+htmlAttributed.swift
//  KLM Assignment
//
//  Created by Евгений Урбановский on 5/5/23.
//

import UIKit

extension String {
    func htmlAttributed(
        using systemFont: UIFont = .systemFont(ofSize: 13)
    ) -> NSAttributedString? {
        guard let data = self.data(using: .utf8) else { return nil }
        
        let options: [NSAttributedString.DocumentReadingOptionKey: Any] = [
            .documentType: NSAttributedString.DocumentType.html,
            .characterEncoding: String.Encoding.utf8.rawValue
        ]
        
        guard let attributedText = try? NSMutableAttributedString(
            data: data,
            options: options,
            documentAttributes: nil
        ) else { return nil }
        
        let fullRange = NSRange(location: 0, length: attributedText.length)
        attributedText.addAttributes([.font: systemFont], range: fullRange)
        
        return attributedText
    }
}
