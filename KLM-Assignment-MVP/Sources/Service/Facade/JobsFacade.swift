//
//  JobsFacade.swift
//  KLM Assignment
//
//  Created by Евгений Урбановский on 5/3/23.
//

import Foundation

enum JobsFacadeError: Error {
    case failed
}

protocol JobsFacade {
    func fetchJobs(completion: @escaping ((Result<[JobDTO], JobsFacadeError>) -> Void))
}

struct JobsFacadeImpl: JobsFacade {
    private let jobsProvider: JobsProvider
    private let jobsRepository: JobsRepository
    
    init(
        jobsProvider: JobsProvider = JobsProviderImpl(),
        jobsRepository: JobsRepository = JobsRepository()
    ) {
        self.jobsProvider = jobsProvider
        self.jobsRepository = jobsRepository
    }
    
    func fetchJobs(completion: @escaping ((Result<[JobDTO], JobsFacadeError>) -> Void)) {
        jobsProvider.fetchJobs { result in
            self.handleFetchJobsResult(result, completion: completion)
        }
    }
    
    private func handleFetchJobsResult(
        _ result: Result<JobDataResponse, Error>,
        completion: @escaping ((Result<[JobDTO], JobsFacadeError>) -> Void)
    ) {
        switch result {
        case .success(let success):
            let cache = success.data.map(JobDTO.init)
            jobsRepository.saveJobs(dto: cache)
            completion(.success(cache))
        case .failure:
            let cache = jobsRepository.fetchJobs()
            if !cache.isEmpty {
                completion(.success(cache))
            } else {
                completion(.failure(JobsFacadeError.failed))
            }
            NSLog("Couldn't load data from API.")
        }
    }
}
