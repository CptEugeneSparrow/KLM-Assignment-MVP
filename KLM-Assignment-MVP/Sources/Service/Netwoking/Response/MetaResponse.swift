//
//  MetaResponse.swift
//  KLM Assignment
//
//  Created by Евгений Урбановский on 5/2/23.
//

struct MetaResponse: Codable {
    let currentPage: Int
    let from: Int
    let path: String
    let perPage: Int
    let to: Int
    let terms: String
    let info: String
    
    private enum CodingKeys: String, CodingKey {
        case currentPage = "current_page"
        case from
        case path
        case perPage = "per_page"
        case to
        case terms
        case info
    }
}
