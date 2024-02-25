//
//  AutoLayoutVC.swift
//  iOS-Study-Kit
//
//  Created by Anselmus Pavel Adriska on 25/02/24.
//

import UIKit

class AutoLayoutVC: UIViewController {
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false //1
        label.text = "Hello World"
        
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemGray
        view.addSubview(label) //2
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
            //Insert other constraints if any
        ]) //3
    }
}
