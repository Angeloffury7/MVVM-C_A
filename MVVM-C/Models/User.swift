//
//  User.swift
//  MVVM-4
//
//  Created by Veronica Rudiuk on 13.12.22.
//

import Foundation

struct User {
    let login: String?
    let password: String?
}

extension User {
    static var logins = [
    User(login: "lexone", password: "12345")
    ]
}
