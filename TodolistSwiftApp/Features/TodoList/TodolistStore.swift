//
//  TodolistStore.swift
//  TodolistSwiftApp
//
//  Created by Kazuki Abe on 2022/10/10.
//

import Foundation

class TodolistStore: ObservableObject {
    @Published var state: TodolistStateProtocol = TodolistState()
}

protocol TodolistStateProtocol {
    var tasks: [Task] { get set }
    mutating func load() async throws
}

struct TodolistState: TodolistStateProtocol {
    var tasks: [Task] = Task.sampleData

    let repository: TaskRepositoryProtocol =  TaskRepository()

    mutating func load() async throws {
        do {
            tasks = try await repository.fetch()
        } catch {
            throw error
        }
    }
}
