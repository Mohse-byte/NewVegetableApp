//
//  SignUpViewController.swift
//  NewVegetableApp
//
//  Created by Monish Chopra on 31/05/20.
//  Copyright © 2020 Monish Chopra. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore
import FirebaseCore

class SignUpViewController: UIViewController {

    @IBOutlet weak var FirstNametextfield: UITextField!
    
    @IBOutlet weak var LastNametextfield: UITextField!
    
    @IBOutlet weak var Emailtextfield: UITextField!
    
    @IBOutlet weak var Passwordtextfield: UITextField!
    
    @IBOutlet weak var signUpButton: UIButton!
    
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.SetbackgroundColor(colorOne: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), colortwo: #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1))
        setUpElements()
        
    }
    
    func setUpElements()  {
        
        //Hide the Error Label
        errorLabel.alpha = 0
        //Style the Elements
        Utilities.styleTextField(FirstNametextfield, textfieldtext: "First Name")
        Utilities.styleTextField(LastNametextfield,textfieldtext: "Last Name")
        Utilities.styleTextField(Emailtextfield, textfieldtext: "Email")
        Utilities.styleTextField(Passwordtextfield, textfieldtext: "Password")
        Utilities.styleFilledButton(signUpButton)
        
    }
    // Check the field and valide that the data is correct, if everything is correct, these methode return nil, otherwise return the error message
    func validatefield() -> String? {
        
        // check that all fields are filled in
        if FirstNametextfield.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || LastNametextfield.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || Emailtextfield.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || Passwordtextfield.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            
            return "Please fill in all fields "
        }
        
        // check if the password is secure
        
        let cleanPassword = Passwordtextfield.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        if Utilities.isPasswordValid(cleanPassword) == false {
            // password isnt secure enough
            return "Please make sure your password is at least 8 character, it contains special character and number."
        }
        return nil
    }

    
    @IBAction func signUpTapped(_ sender: Any) {
        
        // validate the fields
        let error = validatefield()
        
        if error != nil {
            
        // ther are somthing wrong with fields, show error message
            showError(error!)
        }
        else {
            // create cleaned version of the data
            let firstname = FirstNametextfield.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let lastname = LastNametextfield.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let email = Emailtextfield.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = Passwordtextfield.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            //create the user
            Auth.auth().createUser(withEmail: email, password: password) { (result, err) in
                //check for error
                if err != nil {
                    //there was an error creating user
                    self.showError("error creating user")
                }
                else {
                    
                // user was created successfully, store the first name and last name
                let db = Firestore.firestore()
                db.collection("users").addDocument(data: ["firstname":firstname, "lastname":lastname, "uid": result!.user.uid]) { (error) in
                        
                if error != nil {
                            
                //show error message
                            
                self.showError("error saving user data")
                      }
                    }
                    
                //transition to home screen
                self.transitionTohome()
                }
                
               }
            
              }
               
            }
    
        func showError(_ message:String)  {
        
        errorLabel.text = message
        errorLabel.alpha = 1
    }
    
        func transitionTohome()  {
        
        let homeViewController =    storyboard?.instantiateViewController(identifier: constants.storyboard.homeViewController) as? HomeViewController
        view.window?.rootViewController = homeViewController
        view.window?.makeKeyAndVisible()
        
        
    }
    
}
