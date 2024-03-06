//
//  SecondVC.swift
//  iOS-Study-Kit
//
//  Created by Anselmus Pavel Adriska on 29/02/24.
//

import UIKit

class SecondVC: UIViewController {
    
    var parentVC: UIViewController?
    
    lazy var button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Pop VC", for: .normal)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        
        return button
    }()
    
    @objc func didTapButton() {
        //1. Pop the topViewController of navigationController
        //self.navigationController?.popViewController(animated: true)
        
        //2. Pop all the viewController inside the stack except the rootViewController
        //self.navigationController?.popToRootViewController(animated: true)
        
        //3. Pop until a specific viewController becomes the topViewController
        /*
         Here, parentVC type is FirstVC.
         But you can't use this function like below, use a new instance of the viewController even if it is the same type, as it will cause a crash.
         
         WRONG EXAMPLE:
         self.navigationController?.popToViewController(firstVC(), animated: true)
         
         You need to have the reference to the specific viewController to use this function like example below.
         CORRECT EXAMPLE:
         */
        if let parentVC = self.parentVC {
            self.navigationController?.popToViewController(parentVC, animated: true)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemOrange
        view.addSubview(button)
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
}
