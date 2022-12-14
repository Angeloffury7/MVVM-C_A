//
//  DetailVC.swift
//  MVVM-C
//
//  Created by Veronica Rudiuk on 14.12.22.
//

import UIKit

class DetailVC: UIViewController, Storybordable {
    
    weak var coordinator: AppCoordinator?
    var viewModel: DetailViewModel?
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Detail view loaded")
        updateUI()
    }
    
    func updateUI(){
        nameLabel.text = viewModel?.model?.name
        phoneLabel.text = viewModel?.model?.phone
        emailLabel.text = viewModel?.model?.email
        cityLabel.text = viewModel?.model?.city
    }
}
