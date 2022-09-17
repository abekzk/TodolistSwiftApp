//
//  TaskStore.swift
//  TodolistSwiftApp
//
//  Created by Kazuki Abe on 2022/09/11.
//

import Foundation
import SwiftUI

class TaskStore: ObservableObject {
    @Published var tasks: [Task] = []

    static func fetch(completion: @escaping (Result<[Task], Error>) -> Void) {
        completion(.success(Task.sampleData))
    }
}
