//
//  ViewModel.swift
//  MVVM-4
//
//  Created by Veronica Rudiuk on 13.12.22.
//

import Foundation
import UIKit.UIColor

class LoginViewModel {
    var statusText = Dynamic("")
    var statusColor = Dynamic(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
    var isLoggedIn = false
    
    func userButtonPressed(login: String, password: String) {
        if login != User.logins[0].login || password != User.logins[0].password {
            statusText.value = "Log in failed."
            statusColor.value = #colorLiteral(red: 0.3098039329, green: 0.01568627544, blue: 0.1294117719, alpha: 1)
            isLoggedIn = false
        } else {
            statusText.value = "You successfully logged in."
            statusColor.value = #colorLiteral(red: 0.1960784346, green: 0.3411764801, blue: 0.1019607857, alpha: 1)
            isLoggedIn = true
        }
    }
}
