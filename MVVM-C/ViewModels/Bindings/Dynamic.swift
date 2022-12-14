//
//  Dynamic.swift
//  MVVM-4
//
//  Created by Veronica Rudiuk on 13.12.22.
//

import Foundation

class Dynamic<T> {
    typealias Listener = (T) -> Void
    
    private var listener: Listener?
    
    func bind(_ listener: Listener?) {
        self.listener = listener
    }
    
    var value: T {
        didSet {
            listener?(value)
        }
    }
    
    init(_ v: T) {
        value = v
    }
}
