//
//  HomeViewController.swift
//  NewVegetableApp
//
//  Created by Monish Chopra on 31/05/20.
//  Copyright © 2020 Monish Chopra. All rights reserved.
//

import UIKit

class HomeViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
          self.showSpinner()
        Timer.scheduledTimer(withTimeInterval: 3.0, repeats: false) { (t) in
            self.removeSpinner()
           print("done")
       }
    }
    

    

}
