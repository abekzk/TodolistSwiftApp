//
//  ContentView.swift
//  TodolistSwiftApp
//
//  Created by Kazuki Abe on 2022/09/04.
//

import SwiftUI

struct TodolistView<VM>: View where VM: TodolistViewModelProtocol {
    @ObservedObject var viewModel: VM
    @State private var isShowingSheet = false

    init(viewModel: VM) {
        self.viewModel = viewModel
    }

    var body: some View {
        List {
            ForEach($viewModel.tasks, id: \.id) { $task in
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
                try await viewModel.load()
                debugPrint("Todolist on Task")
            } catch {

            }
        }
    }
}

struct TodolistView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            TodolistView(viewModel: TodolistViewModel(repository: TaskRepository()))
        }
    }
}
