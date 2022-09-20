//
//  SignInView.swift
//  TodolistSwiftApp
//
//  Created by Kazuki Abe on 2022/09/19.
//

import SwiftUI
import FirebaseAuth

struct SignInView: View {
    @State private var email = ""
    @State private var password = ""

    var body: some View {
        VStack(spacing: 15) {
            Text("Sign In")
                .bold()

            TextField("メールアドレス（半角英数）", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .frame(width: 300)

            SecureField("パスワード（半角英数）", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .frame(width: 300)

            Button(action: {
                Auth.auth().signIn(withEmail: email, password: password) { authResult, _ in
                        debugPrint(authResult)
                    }
                }, label: {
                    Text("ログイン")
                })
                .frame(width: 200, height: 45)
                .foregroundColor(Color.white)
                .background(Color.blue)
                .cornerRadius(10, antialiased: true)
                .disabled(false)
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 30, trailing: 0))
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
