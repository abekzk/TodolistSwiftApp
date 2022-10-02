//
//  TaskStore.swift
//  TodolistSwiftApp
//
//  Created by Kazuki Abe on 2022/09/11.
//

import Foundation
import SwiftUI
import Alamofire
import FirebaseAuth

class TaskStore: ObservableObject {
    @Published var tasks: [Task] = []
    let repository: TaskRepositoryProtocol

    init(repository: TaskRepositoryProtocol) {
        self.repository = repository
    }

    @MainActor
    func load() async throws {
        do {
            tasks = try await repository.fetch()
        } catch {
            throw error
        }
    }

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
        let user = Auth.auth().currentUser
        user?.getIDToken { idToken, error in
            if let error = error {
                return
            }
            let headers: HTTPHeaders = [.authorization(bearerToken: idToken ?? "")]
            AF.request(Configs.apiURL + "/v1/tasks", headers: headers).responseDecodable(of: [Task].self) { response in
                switch response.result {
                case .success(let tasks):
                    completion(.success(tasks))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        }
    }
}
