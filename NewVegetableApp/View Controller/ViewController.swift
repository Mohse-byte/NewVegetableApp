//
//  ViewController.swift
//  NewVegetableApp
//
//  Created by Monish Chopra on 31/05/20.
//  Copyright © 2020 Monish Chopra. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var signUpButton: UIButton!
    
    @IBOutlet weak var LoginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.SetbackgroundColor(colorOne: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), colortwo: #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1))
        setUpElements()
    }

    func setUpElements()  {
        
        Utilities.styleFilledButton(signUpButton)
        Utilities.styleHollowButton(LoginButton)
        
    }
    
    
}

