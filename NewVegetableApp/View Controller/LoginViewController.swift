//
//  LoginViewController.swift
//  NewVegetableApp
//
//  Created by Monish Chopra on 31/05/20.
//  Copyright © 2020 Monish Chopra. All rights reserved.
//

import UIKit
import FirebaseAuth
import KeychainSwift

class LoginViewController: UIViewController {

    
    @IBOutlet weak var emailtextfield: UITextField!
    
    @IBOutlet weak var passwordtextfield: UITextField!
    
    
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var errorLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.savedatakeychain()
        
        
        view.SetbackgroundColor(colorOne: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), colortwo: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
        SetUpElements()
    }
    
    
    func SetUpElements()  {
        
        //Hide the Error Label
        errorLabel.alpha = 0
        //Style the Elements
        Utilities.styleTextField(emailtextfield,textfieldtext: "Email")
        Utilities.styleTextField(passwordtextfield, textfieldtext: "Password")
        Utilities.styleFilledButton(loginButton)
    }

    
    @IBAction func loginTapped(_ sender: Any) {
        
        // TODO: validate TextFields
        
        //Create clean version of the textfield
        let email = emailtextfield.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = passwordtextfield.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        // Signing in the User
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            self.keychansaveLoginData()
            
            if error != nil {
                // Coudn't Sign in
                self.errorLabel.text = error!.localizedDescription
                self.errorLabel.alpha = 1
              
            }
            else {
                
         let homeViewController =    self.storyboard?.instantiateViewController(identifier: constants.storyboard.homeViewController) as? HomeViewController
             self.view.window?.rootViewController = homeViewController
             self.view.window?.makeKeyAndVisible()
                
                UserDefaults.standard.set(true, forKey: "login")
                
            }
        }
        
    }
    
}
