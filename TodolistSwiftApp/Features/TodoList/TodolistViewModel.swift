//
//  TodolistViewModel.swift
//  TodolistSwiftApp
//
//  Created by Kazuki Abe on 2022/10/02.
//

import Foundation

protocol TodolistViewModelProtocol: ObservableObject {
    var tasks: [Task] { get set }
    func load() async throws
}

class TodolistViewModel: TodolistViewModelProtocol {
    @Published var tasks: [Task] = Task.sampleData

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

}
