//
//  JobsType.swift
//  KLM Assignment
//
//  Created by Евгений Урбановский on 5/2/23.
//

import Foundation
import Moya

enum JobBoardAPI {
    case fetchJobs
}

extension JobBoardAPI: TargetType {
    var baseURL: URL {
        URL(string: "https://www.arbeitnow.com/api")!
    }
    
    var path: String {
        switch self {
        case .fetchJobs:
            return "/job-board-api"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .fetchJobs:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .fetchJobs:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        ["Content-Type": "application/json"]
    }
    
    var sampleData: Data {
        Data()
    }
}

