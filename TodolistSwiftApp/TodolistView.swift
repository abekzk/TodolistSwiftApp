//
//  ContentView.swift
//  TodolistSwiftApp
//
//  Created by Kazuki Abe on 2022/09/04.
//

import SwiftUI

struct TodolistView: View {
    @Binding var tasks: [Task]

    var body: some View {
        List {
            ForEach($tasks, id: \.id) { $task in
                NavigationLink(destination: TaskDetailView(task: $task)) {
                    TodolistItemView(task: task)
                }
            }
        }
        .navigationTitle("タスク一覧")
    }
}

struct TodolistView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            TodolistView(tasks: .constant(Task.sampleData))
        }
    }
}
