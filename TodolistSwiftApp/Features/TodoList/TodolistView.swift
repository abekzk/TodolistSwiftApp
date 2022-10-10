//
//  ContentView.swift
//  TodolistSwiftApp
//
//  Created by Kazuki Abe on 2022/09/04.
//

import SwiftUI

struct TodolistView: View {
    @Binding var state: TodolistStateProtocol
    @State private var isShowingSheet = false

    var body: some View {
        List {
            ForEach($state.tasks, id: \.id) { $task in
                NavigationLink(destination: TaskDetailView(task: $task)) {
                    TodolistItemView(task: task)
                }
            }
        }
        .navigationTitle("タスク一覧")
        .toolbar {
            Button(action: {
                isShowingSheet.toggle()
            }, label: {
                Image(systemName: "person.crop.circle")
            })
            .sheet(isPresented: $isShowingSheet) {
                SignInView()
            }
        }
        .task {
            do {
                try await state.load()
            } catch {
            }
        }
    }
}

struct TodolistView_Previews: PreviewProvider {
    struct Repository: TaskRepositoryProtocol {
        func fetch() async throws -> [Task] {
            return Task.sampleData
        }
    }
    static var previews: some View {
        NavigationView {
            TodolistView(state: .constant(TodolistState(repository: Repository(), tasks: [])))
        }
    }
}
