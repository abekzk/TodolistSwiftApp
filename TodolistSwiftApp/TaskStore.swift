//
//  TaskStore.swift
//  TodolistSwiftApp
//
//  Created by Kazuki Abe on 2022/09/11.
//

import Foundation
import SwiftUI
import Alamofire

class TaskStore: ObservableObject {
    @Published var tasks: [Task] = []

    static func fetch() async throws -> [Task] {
        try await withCheckedThrowingContinuation { continuation in
            fetch {result in
                switch result {
                case .failure(let error):
                    continuation.resume(throwing: error)
                case .success(let tasks):
                    continuation.resume(returning: tasks)
                }
            }
        }
    }

    static func fetch(completion: @escaping (Result<[Task], Error>) -> Void) {
        AF.request(Configs.apiURL + "/public/tasks").responseDecodable(of: [Task].self) { response in
            switch response.result {
            case .success(let tasks):
                completion(.success(tasks))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
