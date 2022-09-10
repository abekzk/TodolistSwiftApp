//
//  TodolistSwiftAppApp.swift
//  TodolistSwiftApp
//
//  Created by Kazuki Abe on 2022/09/04.
//

import SwiftUI

@main
struct TodolistSwiftAppApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView{
                TodolistView(tasks: Task.sampleData)
            }
        }
    }
}
