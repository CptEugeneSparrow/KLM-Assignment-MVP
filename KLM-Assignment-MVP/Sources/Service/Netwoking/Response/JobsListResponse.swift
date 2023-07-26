//
//  JobsListResponse.swift
//  KLM Assignment
//
//  Created by Евгений Урбановский on 5/2/23.
//

struct JobDataResponse: Codable {
    let data: [JobResponse]
    let links: LinksResponse
    let meta: MetaResponse
}
