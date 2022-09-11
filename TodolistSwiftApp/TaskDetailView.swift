//
//  TaskDetailView.swift
//  TodolistSwiftApp
//
//  Created by Kazuki Abe on 2022/09/10.
//

import SwiftUI

struct TaskDetailView: View {
    let task: Task

    var body: some View {
        Text(task.description)
    }
}

struct TaskDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            TaskDetailView(task: Task.sampleData[0])
        }
    }
}
