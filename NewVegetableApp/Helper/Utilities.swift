//
//  Utilities.swift
//  NewVegetableApp
//
//  Created by Monish Chopra on 31/05/20.
//  Copyright © 2020 Monish Chopra. All rights reserved.
//

import Foundation
import UIKit

class Utilities {
    
    
    static func styleTextField (_ textfield:UITextField, textfieldtext: String) {
        
        //To Create the Bottom Line
        
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0, y: textfield.frame.height - 2, width: textfield.frame.width, height: 2)
        bottomLine.backgroundColor = UIColor.init(red: 48/255, green: 173/255, blue: 99/255, alpha: 1).cgColor
        // Remove Border on TextField
        textfield.borderStyle = .none
        // Color TextField PlaceHolder 
        textfield.attributedPlaceholder = NSAttributedString(string: textfieldtext, attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
        //Add the Line to the TextField
        textfield.layer.addSublayer(bottomLine)
    }
    
    
    static func styleFilledButton(_ button:UIButton){
        
        // Filled Rounded Corner style
        button.backgroundColor = UIColor.init(red: 48/255, green: 173/255, blue: 99/255, alpha: 1)
        button.layer.cornerRadius = 25.0
        button.tintColor = UIColor.white
        
    }
    
    static func styleHollowButton(_ button:UIButton){
        
        
        // Hollow Rounded Corner style
        
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.cornerRadius = 25.0
        button.tintColor = UIColor.black
        
    }
    
    static func isPasswordValid(_ password : String) -> Bool{
        
        let regex = "(?:(?:(?=.*?[0-9])(?=.*?[-!@#$%&*ˆ+=_])|(?:(?=.*?[0-9])|(?=.*?[A-Z])|(?=.*?[-!@#$%&*ˆ+=_])))|(?=.*?[a-z])(?=.*?[0-9])(?=.*?[-!@#$%&*ˆ+=_]))[A-Za-z0-9-!@#$%&*ˆ+=_]{6,15}"
        let passwordTest = NSPredicate(format: "SELF MATCHES %@",regex)
        return passwordTest.evaluate(with: password)
    }
    
}
