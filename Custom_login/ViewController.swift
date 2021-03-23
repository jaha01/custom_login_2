//
//  ViewController.swift
//  Custom_login
//
//  Created by Jahongir on 9/18/20.
//  Copyright © 2020 Jahongir. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var signUpButton: UIButton!
    
    @IBOutlet weak var loginButton: UIButton!
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

    setUpElements()
}

func setUpElements(){
    
    Utilities.styleFilledButton(signUpButton)
    Utilities.styleHollowButton(loginButton)
    
    }
    
    
}
