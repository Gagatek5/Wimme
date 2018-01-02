//
//  LogInSceenVC.swift
//  Wimme
//
//  Created by Tom on 18/11/2017.
//  Copyright © 2017 doThisApp. All rights reserved.
//

import UIKit
import Firebase

class LogInSceenVC: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var userNameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func TryLogIn(_ sender: Any) {

        Auth.auth().signIn(withEmail: userNameTF.text!, password: passwordTF.text!)
        {
            (user, error) in
            if(error==nil)
            {
                self.performSegue(withIdentifier: "LogIn", sender: sender)
            } else
            {
                let alertController = UIAlertController(title: "", message:"Wrong email or password", preferredStyle: UIAlertControllerStyle.alert)
                alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                
                self.present(alertController, animated: true, completion: nil)
            }
        }
        
    }
    
    @IBAction func RegisterForm(_ sender: Any) {
        performSegue(withIdentifier: "Register", sender: sender)
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
