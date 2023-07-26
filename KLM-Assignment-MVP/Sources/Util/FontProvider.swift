//
//  FontProvider.swift
//  KLM Assignment
//
//  Created by Евгений Урбановский on 5/4/23.
//

import UIKit.UIFont

enum FontProvider {
    static let headerBold = bold(size: 32)
    static let titleBold = bold(size: 24)
    static let bodyMedium = medium(size: 16)
    
    static func bold(size: CGFloat) -> UIFont {
        UIFont.systemFont(ofSize: size, weight: .bold)
    }
    
    static func medium(size: CGFloat) -> UIFont {
        UIFont.systemFont(ofSize: size, weight: .medium)
    }
    
    static func regular(size: CGFloat) -> UIFont {
        UIFont.systemFont(ofSize: size, weight: .regular)
    }
}
