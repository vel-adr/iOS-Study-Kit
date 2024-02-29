//
//  FirstVC.swift
//  iOS-Study-Kit
//
//  Created by Anselmus Pavel Adriska on 26/02/24.
//

import UIKit

class FirstVC: UIViewController {
    
    lazy var button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Push VC", for: .normal)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        
        return button
    }()
    
    // Push View Controller
    @objc func didTapButton() {
        //- Normal push to another VC
        let destination = SecondVC()
        self.navigationController?.pushViewController(destination, animated: true)
        
        //- Push same type of VC, different instance to the stack.
        //let destination = FirstVC()
        //self.navigationController?.pushViewController(destination, animated: true)
        
        //- Push same type of VC, same instance to the stack
        //let destination = self
        //self.navigationController?.pushViewController(destination, animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemGray5
        view.addSubview(button)
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
}
