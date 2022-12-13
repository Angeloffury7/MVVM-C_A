//
//  ViewController.swift
//  MVVM-4
//
//  Created by Veronica Rudiuk on 12.12.22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var loginField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var label: UILabel!
    
    var viewModel = ViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
        initialState()
    }
    
    func initialState() {
        label.text = ""
    }
    
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        viewModel.userButtonPressed(login: loginField.text ?? "", password: passwordField.text ?? "")
    }
    
    func bindViewModel() {
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


