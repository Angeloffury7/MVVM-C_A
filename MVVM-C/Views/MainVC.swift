//
//  MainVC.swift
//  MVVM-C
//
//  Created by Veronica Rudiuk on 14.12.22.
//

import UIKit

class MainVC: UIViewController, Storybordable {
    weak var coordinator: AppCoordinator?
    var viewModel: MainViewModel?
    
    @IBOutlet weak var mainLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainLabel.text = "Hello, \(viewModel?.login ?? "user")"
        print("Main screen loaded")
    }
    
    @IBAction func aboutButtonPressed(_ sender: Any) {
        coordinator?.showDetail()
    }
}
