//
//  JobsProvider.swift
//  KLM Assignment
//
//  Created by Евгений Урбановский on 5/2/23.
//

import Foundation
import Moya

protocol JobsProvider {
    func fetchJobs(completion: @escaping (Result<JobDataResponse, Error>) -> Void)
}

final class JobsProviderImpl: JobsProvider {
    private let provider = MoyaProvider<JobBoardAPI>()
    private let jsonDecoder: JSONDecoder
    
    init(jsonDecoder: JSONDecoder = JSONDecoder()) {
        self.jsonDecoder = jsonDecoder
    }
    
    func fetchJobs(completion: @escaping (Result<JobDataResponse, Error>) -> Void) {
        provider.request(.fetchJobs) { [weak self] result in
            guard let self else { return }
            self.handleRequestResult(result, completion: completion)
        }
    }
    
    private func handleRequestResult(
        _ result: Result<Response, MoyaError>,
        completion: @escaping (Result<JobDataResponse, Error>) -> Void
    ) {
        switch result {
        case .success(let response):
            do {
                let jobs = try jsonDecoder.decode(JobDataResponse.self, from: response.data)
                completion(.success(jobs))
            } catch let error {
                NSLog("Failed to fetch data, reason: \(error.localizedDescription)")
                completion(.failure(error))
            }
        case .failure(let error):
            NSLog("Failed to fetch data, reason: \(error.localizedDescription).")
            completion(.failure(error))
        }
    }
}
