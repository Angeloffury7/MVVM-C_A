//
//  Coordinator.swift
//  MVVM-C
//
//  Created by Veronica Rudiuk on 14.12.22.
//

import UIKit

protocol Coordinator {
    var navigationController: UINavigationController { get set }
    func start()
}
