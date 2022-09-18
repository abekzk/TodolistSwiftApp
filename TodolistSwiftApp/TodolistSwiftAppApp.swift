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
            .task {
                do {
                    store.tasks = try await TaskStore.fetch()
                } catch {
                    fatalError("Error loadint tasks.")
                }
            }
        }
    }
}
