//
//  UserData.swift
//  MVVM-C
//
//  Created by Veronica Rudiuk on 14.12.22.
//

import Foundation

struct UserData {
    var name: String?
    var city: String?
    var email: String?
    var phone: String?
}

extension UserData {
    static var userData = UserData(name: "Veronica", city: "Minsk", email: "tesr@mail.com", phone: "+357(33)5533992")
}
