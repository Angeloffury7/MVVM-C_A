//
//  ViewController.swift
//  MVVM-4
//
//  Created by Veronica Rudiuk on 12.12.22.
//

import UIKit

class LoginVC: UIViewController, Storybordable {
    
    @IBOutlet weak var loginField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var label: UILabel!
    
    var viewModel: LoginViewModel?
    var coordinator: AppCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
        initialState()
    }
    
    func initialState() {
        label.text = ""
    }
    
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        guard let viewModel = viewModel else { return }
        viewModel.userButtonPressed(login: loginField.text ?? "", password: passwordField.text ?? "")
        if viewModel.isLoggedIn {
            coordinator?.isLoggedIn = viewModel.isLoggedIn
            coordinator?.showMain(login: loginField.text ?? "")
        }
    }
    
    func bindViewModel() {
        guard let viewModel = viewModel else { return }
        viewModel.statusText.bind { statusText in
            DispatchQueue.main.async {
                self.label.text = statusText
            }
        }
        viewModel.statusColor.bind { statusColor in
            DispatchQueue.main.async {
                self.label.textColor = statusColor
            }
        }
    }
}


