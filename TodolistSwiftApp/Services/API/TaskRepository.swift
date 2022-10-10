//
//  TaskRepository.swift
//  TodolistSwiftApp
//
//  Created by Kazuki Abe on 2022/09/23.
//

import Foundation
import Alamofire

protocol TaskRepositoryProtocol {
    func fetch() async throws -> [Task]
}

struct TaskRepository: TaskRepositoryProtocol {
    func fetch() async throws -> [Task] {
        do {
            let value = try await AF.request(Configs.apiURL + "/public/tasks").serializingDecodable([Task].self).value
            return value
        } catch {
            throw error
        }
    }
}
