//
//  ViewModel.swift
//  MVVM-4
//
//  Created by Veronica Rudiuk on 13.12.22.
//

import Foundation
import Combine

enum ViewStates {
    case loading
    case success
    case failed
    case none
}

class LoginViewModel {
    @Published var email = ""
    @Published var password = ""
    @Published var state: ViewStates = .none
    
    var isLoggedIn = false
    
    var coordinator: AppCoordinator?
    
    var isValisdEmailPublisher: AnyPublisher<Bool, Never> {
        $email
            .map { $0.isEmail() }
            .eraseToAnyPublisher()
    }
    
    var isValisdPasswordPublisher: AnyPublisher<Bool, Never> {
        $password
            .map { !$0.isEmpty }
            .eraseToAnyPublisher()
    }
    
    var isLoginEnabled: AnyPublisher<Bool, Never> {
        Publishers.CombineLatest(isValisdEmailPublisher, isValisdPasswordPublisher)
            .map { $0 && $1 }
            .eraseToAnyPublisher()
    }
    
    func submitLogin() {
        state = .loading
        
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1)) { [weak self] in
            guard let self = self else { return }
            if self.isCorrectLogin() {
                self.state = .success
            } else {
                self.state = .failed
            }
        }
    }
    
    
    func isCorrectLogin() -> Bool {
        return email == "test@mail.com" && password == "12345"
    }
}

