//
//  TodolistStore.swift
//  TodolistSwiftApp
//
//  Created by Kazuki Abe on 2022/10/10.
//

import Foundation

class TodolistStore: ObservableObject {
    @Published var state: TodolistStateProtocol

    init(state: TodolistStateProtocol) {
        self.state = state
    }
}

protocol TodolistStateProtocol {
    var tasks: [Task] { get set }
    mutating func load() async throws
}

struct TodolistState: TodolistStateProtocol {
    let repository: TaskRepositoryProtocol

    var tasks: [Task]

    mutating func load() async throws {
        do {
            tasks = try await repository.fetch()
        } catch {
            throw error
        }
    }
}
