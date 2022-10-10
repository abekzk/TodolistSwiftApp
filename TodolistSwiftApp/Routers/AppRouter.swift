//
//  AppRouter.swift
//  TodolistSwiftApp
//
//  Created by Kazuki Abe on 2022/10/02.
//

import Foundation
import SwiftUI

enum AppRouterScreen {
    case top
}

class AppRouter: ObservableObject {
    @Published var screen: AppRouterScreen = .top

    @ViewBuilder
    func top() -> some View {

    }
}

struct AppRouterView: View {
    @StateObject var router = AppRouter()

    @StateObject private var store = TodolistStore()

    var body: some View {
        switch self.router.screen {
        case .top:
            NavigationView {
                TodolistView(state: $store.state)
            }
        }
    }
}
