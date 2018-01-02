//
//  EditProfileVC.swift
//  Wimme
//
//  Created by Tom on 18/11/2017.
//  Copyright © 2017 doThisApp. All rights reserved.
//

import UIKit

class EditProfileVC: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var firstNameTF: UITextField!
    @IBOutlet weak var LastName: UITextField!
    @IBOutlet weak var DescriptionTV: UITextView!
    @IBOutlet weak var saveButton: UIButton!
    
    var checkFirstName = false
    var checkLastName = false
    override func viewDidLoad() {
        super.viewDidLoad()
        saveButton.isEnabled = false
        // Do any additional setup after loading the view.
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
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func CheckFirstName(_ sender: Any) {
        if ((firstNameTF.text?.count)! <= 3)
        {
            let alertController = UIAlertController(title: "", message:"First Name must 3 or more charachter!", preferredStyle: UIAlertControllerStyle.alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            
            self.present(alertController, animated: true, completion: nil)
            
            
        }else{
            checkFirstName = true
            EnableButton()
           
        }
        
    }
    @IBAction func CheckLastName(_ sender: Any) {
        if ((LastName.text?.count)! <= 3)
        {
            let alertController = UIAlertController(title: "", message:"Last Name must 3 or more charachter!", preferredStyle: UIAlertControllerStyle.alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            
            self.present(alertController, animated: true, completion: nil)
            
            
        }else{
            checkLastName = true
            EnableButton()
        }
        
        
    }
    
    func EnableButton(){
        if( checkLastName == true && checkFirstName == true)
        {
            saveButton.isEnabled = true
        }else{
            saveButton.isEnabled = false
        }
        
        
    }
  
    @IBAction func DissmisViewAndSave(_ sender: Any) {
        print(firstNameTF.text!)
        print(LastName.text!)
      
        print(DescriptionTV.text!)
        //self.dismiss(animated: true, completion: nil)
        UpdateUserProfile.updateProfile(firstName: firstNameTF.text, lastName: LastName.text, photoUrl: "", description: DescriptionTV.text)
    }
    @IBAction func LogOutButton(_ sender: Any) {
        LogOut.logOut()
        
        print(CheckConnection.checkIfConnectedToFIR())
    }
}
