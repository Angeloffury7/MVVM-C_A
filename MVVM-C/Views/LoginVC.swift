//
//  ViewController.swift
//  MVVM-4
//
//  Created by Veronica Rudiuk on 12.12.22.
//

import UIKit
import Combine

class LoginVC: UIViewController, Storybordable {
    
    @IBOutlet weak var loginField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var loginButtonOutlet: UIButton!
    
    var viewModel: LoginViewModel?
    var coordinator: AppCoordinator?
    var cancellables = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
        initialState()
    }
    
    func initialState() {
        label.isHidden = true
        label.text = ""
        label.textColor = .systemGray
    }
    
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        guard let viewModel = viewModel else { return }
        viewModel.submitLogin()
//        if viewModel.isLoggedIn {
//            coordinator?.isLoggedIn = viewModel.isLoggedIn
//            coordinator?.showMain(login: loginField.text ?? "")
//        }
    }
    
    func bindViewModel() {
        guard let viewModel = viewModel else { return }
        NotificationCenter.default
            .publisher(for: UITextField.textDidChangeNotification, object: loginField)
            .map { ($0.object as! UITextField).text ?? "" }
            .assign(to: \.email, on: viewModel)
            .store(in: &cancellables)
        NotificationCenter.default
            .publisher(for: UITextField.textDidChangeNotification, object: passwordField)
            .map { ($0.object as! UITextField).text ?? "" }
            .assign(to: \.password, on: viewModel)
            .store(in: &cancellables)
        
        viewModel.isLoginEnabled
            .assign(to: \.isEnabled, on: loginButtonOutlet)
            .store(in: &cancellables)
        
        viewModel.$state
            .sink { [weak self] state in
                switch state {
                case .loading:
                    self?.label.isHidden = true
                    self?.loginButtonOutlet.isEnabled = false
                    self?.loginButtonOutlet.setTitle("Loading...", for: .normal)
                case .success:
                    viewModel.isLoggedIn = true
                    self?.label.isHidden = false
                    self?.label.text = "Login success!"
                    self?.loginButtonOutlet.isEnabled = false
                    self?.loginButtonOutlet.setTitle("Loading...", for: .normal)
                    DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1)) { [weak self] in
                        self?.coordinator?.isLoggedIn = viewModel.isLoggedIn
                        self?.coordinator?.showMain(login: self?.loginField.text ?? "")
                    }
                case .failed:
                    viewModel.isLoggedIn = false
                    self?.label.isHidden = false
                    self?.label.text = "Login failed :("
                    self?.loginButtonOutlet.isEnabled = false
                    self?.loginButtonOutlet.setTitle("Loading...", for: .normal)
                case .none:
                    break
                }
            }
            .store(in: &cancellables)
    }
}


