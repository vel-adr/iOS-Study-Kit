//
//  VarDeclarationVC.swift
//  iOS-Study-Kit
//
//  Created by Anselmus Pavel Adriska on 23/02/24.
//

import UIKit

class VarDeclarationVC: UIViewController {
    
    //1. Basic stored property
    let message = "Hello World"
    
    
    
    //2. Closure-based stored property
    let label: UILabel = {
        let label = UILabel()
        label.text = "This is a label"
        return label
    }()
    
    
    
    //3. Lazy stored property
    class ComplexClass {
        //Just for demo purpose. Imagine this is a complex class to instantiate
    }
    ///Basic lazy stored property declaration
    lazy var complexProperty = ComplexClass()
    
    ///Closure-based lazy stored property declaration
    lazy var longString: String = {
        var string = ""
        for i in 0...1000 {
            string.append(String(i))
        }
        return string
    }()
    
    
    
    //4. Computed Property
    struct Person {
        var name = "Bob"
        var sex = "M"
        var greeting = "Hello"
        
        ///Computed property with getter and setter
        var greetingSentence: String {
            set(newGreeting) {
                greeting = newGreeting
            }
            get {
                return "\(greeting), \(name)"
            }
        }
        
        ///Read-only computed property
        ///Can't be modified
        var pronoun: String {
            return sex == "F" ? "She" : sex == "M" ? "He" : "Unknown"
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
