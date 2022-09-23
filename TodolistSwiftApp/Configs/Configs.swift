//
//  Configs.swift
//  TodolistSwiftApp
//
//  Created by Kazuki Abe on 2022/09/18.
//

import Foundation

struct Configs {
    static let apiURL = Bundle.main.object(forInfoDictionaryKey: "API URL") as? String ?? ""
}
