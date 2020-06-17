//
//  extensions.swift
//  NewVegetableApp
//
//  Created by Monish Chopra on 08/06/20.
//  Copyright © 2020 Monish Chopra. All rights reserved.
//

import UIKit
import KeychainSwift


 var aView : UIView?

extension HomeViewController {
    
    
    func showSpinner()  {
        
         aView = UIView(frame: self.view.bounds)
         aView?.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
        
         let ai = UIActivityIndicatorView(style: .white)
         ai.center = aView!.center
         ai.startAnimating()
         aView?.addSubview(ai)
         self.view.addSubview(aView!)
    }
    
    
    func removeSpinner()  {
        aView?.removeFromSuperview()
        aView = nil
    }
    
}

extension UIView {
    
    func SetbackgroundColor(colorOne: UIColor, colortwo: UIColor)  {
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = [colorOne.cgColor, colortwo.cgColor]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.startPoint = CGPoint(x: 1.0, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 0.0, y: 0.0)
        
        layer.insertSublayer(gradientLayer, at: 0)
    }
}

extension LoginViewController {
    
    func keychansaveLoginData()  {
        
          let keychain = KeychainSwift()
          keychain.set(emailtextfield.text!, forKey: "email")
          keychain.set(passwordtextfield.text!, forKey: "password")
        
       
    }
    
    func savedatakeychain()  {
        let keychains = KeychainSwift()
        let email = keychains.get("email")
        emailtextfield.text = email
        
        let password = keychains.get("password")
        passwordtextfield.text = password
        
       
        
    }
    
    
    
    
    
}
