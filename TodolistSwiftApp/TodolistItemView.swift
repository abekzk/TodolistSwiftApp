//
//  TodolistItemView.swift
//  TodolistSwiftApp
//
//  Created by Kazuki Abe on 2022/09/10.
//

import SwiftUI

struct TodolistItemView: View {
    let task: Task
    var body: some View {
        Text(task.title).font(.headline)
    }
}

struct TodolistItemView_Previews: PreviewProvider {
    static var previews: some View {
        TodolistItemView(task: Task.sampleData[0])
    }
}
