//
//  JobObject.swift
//  KLM Assignment
//
//  Created by Евгений Урбановский on 5/2/23.
//

import Foundation
import RealmSwift

final class JobObject: Object {
    @Persisted(primaryKey: true) var id: UUID
    @Persisted var companyName: String
    @Persisted var title: String
    @Persisted var jobDescription: String
    @Persisted var remote: Bool
    @Persisted var url: String
    @Persisted var location: String
    @Persisted var createdAt: Int
    
    convenience init(
        id: UUID,
        companyName: String,
        title: String,
        jobDescription: String,
        remote: Bool,
        url: String,
        location: String,
        createdAt: Int
    ) {
        self.init()
        self.id = id
        self.companyName = companyName
        self.title = title
        self.jobDescription = jobDescription
        self.remote = remote
        self.url = url
        self.location = location
        self.createdAt = createdAt
    }
}

extension JobObject {
    convenience init(with dto: JobDTO) {
        self.init()
        self.id = id
        self.companyName = companyName
        self.title = title
        self.jobDescription = jobDescription
        self.remote = remote
        self.url = url
        self.location = location
        self.createdAt = createdAt
    }
}
