//
//  ReuseIdentifiable.swift
//  KLM Assignment
//
//  Created by Евгений Урбановский on 5/2/23.
//

import UIKit

protocol ReuseIdentifiable {
    static var reuseIdentifier: String { get }
}

extension ReuseIdentifiable {
    static var reuseIdentifier: String {
        String(describing: self)
    }
}

extension UITableViewCell: ReuseIdentifiable {}


