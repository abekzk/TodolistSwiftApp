//
//  TodolistSwiftAppApp.swift
//  TodolistSwiftApp
//
//  Created by Kazuki Abe on 2022/09/04.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
    FirebaseApp.configure()
    return true
  }
}

@main
struct TodolistSwiftAppApp: App {
    // register app delegate for Firebase setup
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

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
