//
//  Task.swift
//  TodolistSwiftApp
//
//  Created by Kazuki Abe on 2022/09/10.
//

import Foundation

struct Task {
    var id: String
    var title: String
    var description: String
    var status: TaskStatus
}

enum TaskStatus {
    case todo
    case done
}

extension Task {
    static let sampleData: [Task] =
    [
        Task(id: "a", title: "タスク1", description: "タスク説明1", status: TaskStatus.todo),
        Task(id: "b", title: "タスク2", description: "タスク説明2", status: TaskStatus.done)
    ]
}
