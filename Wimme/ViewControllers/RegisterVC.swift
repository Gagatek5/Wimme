//
//  RegisterVC.swift
//  Wimme
//
//  Created by Tom on 18/11/2017.
//  Copyright © 2017 doThisApp. All rights reserved.
//

import UIKit

class RegisterVC: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var userNameTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var reTypePasswordTF: UITextField!
    @IBOutlet weak var informationL: UILabel!
    @IBOutlet weak var RegisterButtonOutlet: UIButton!
    
    var checkUserName = false
    var checkEmail = false
    var checkPassword = false
    var checkRetypePassword = false

    override func viewDidLoad() {
        super.viewDidLoad()
        RegisterButtonOutlet.isEnabled = false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    func EnableButton(){
        
        if (checkUserName == true && checkEmail == true && checkPassword == true && checkRetypePassword == true){
            RegisterButtonOutlet.isEnabled = true
            print(checkRetypePassword," ", checkPassword, " ", checkEmail, " ", checkUserName)
        }else{
            RegisterButtonOutlet.isEnabled = false
        }
    }
    @IBAction func CreateAccount(_ sender: Any) {
       Register.registerUser(username: userNameTF.text!, email: emailTF.text!, pass: passwordTF.text!, retypePass: reTypePasswordTF.text!)
        LogIn.login(email: emailTF.text!, password: passwordTF.text!)
    }
    
    @IBAction func CheckUserNameTF(_ sender: Any) {
        if ((userNameTF.text?.count)! <= 3)
        {
            informationL.text = "User Name must 3 or more charachter!"
            
        }else{
            informationL.text = ""
            checkUserName = true
        }
        EnableButton()
        
    }
    @IBAction func CheckEmailTF(_ sender: Any) {
        if(emailTF.text!.isValidEmail() == false)
        {
            informationL.text = "e-mail must have @ sign!"
            
        }else{
            informationL.text = nil
            checkEmail = true
        }
        EnableButton()
        
        
        
    }
    @IBAction func CheckPasswordTF(_ sender: Any) {
        if(passwordTF.text!.isPasswordValid() == false)
        {
            informationL.text = "Password must have: 8 letter, 1 capital letter, 1 small letter and 1 special sign!"
        }else
        {
            informationL.text = nil
            checkPassword = true
        }
        EnableButton()
    }
    @IBAction func CheckRetypePasswordTF(_ sender: Any) {
        
        if(passwordTF.text != reTypePasswordTF.text)
        {
            informationL.text = "Passwords must be this same!"
        }else
        {
            informationL.text = nil
            checkRetypePassword = true
        }
        EnableButton()
        
    }
    
    //hiding keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    //Presses return key
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return (true)
    }
    

}
