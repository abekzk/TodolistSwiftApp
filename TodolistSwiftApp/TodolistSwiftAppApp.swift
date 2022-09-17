//
//  TodolistSwiftAppApp.swift
//  TodolistSwiftApp
//
//  Created by Kazuki Abe on 2022/09/04.
//

import SwiftUI

@main
struct TodolistSwiftAppApp: App {
    @StateObject private var store = TaskStore()

    var body: some Scene {
        WindowGroup {
            NavigationView {
                TodolistView(tasks: $store.tasks)
            }
            .onAppear {
                TaskStore.fetch { result in
                    switch result {
                    case .failure(let error):
                        fatalError(error.localizedDescription)
                    case .success(let tasks):
                        store.tasks = tasks
                    }
                }
            }
        }
    }
}
